resource "google_compute_network" "working-vpc" {
  project                 = "haithem56929"
  name                    = "my-working-vpc"
  auto_create_subnetworks = false
}
