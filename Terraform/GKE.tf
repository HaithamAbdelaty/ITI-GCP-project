resource "google_container_cluster" "private-gke" {
  name                     = "private-cluster"
  location                 = "us-central1-c"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.working-vpc.id
  subnetwork               = google_compute_subnetwork.restricted-subnet.id

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    #cluster_ipv4_cidr_block = "172.16.0.0/22"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.management-subnet.ip_cidr_range
      display_name = "external access"
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.32/28"
  # " 10.0.0.0/24 "
  }
    
}

resource "google_container_node_pool" "node-pool" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.private-gke.id
  node_count = 1
  
  node_config {
    preemptible  = true
    machine_type = "e2-small"
    service_account = google_service_account.GKE-service-account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}