resource "google_container_cluster" "private-gke" {
  name                     = "private-cluster"
  location                 = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.working-vpc.id
  subnetwork               = google_compute_subnetwork.restricted-subnet.id

  release_channel {
    channel = "REGULAR"
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.100.0.0/16"

  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.management-subnet.ip_cidr_range
      display_name = "external access"
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.0.0.0/28"
  }
}