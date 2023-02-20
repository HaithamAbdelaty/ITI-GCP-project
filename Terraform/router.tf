resource "google_compute_router" "management-subnet-router" {
  name    = "router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.working-vpc.id
}