resource "google_compute_firewall" "working-vpc-firewwall" {
  name    = "ssh-tcp-firewall"
  network = google_compute_network.working-vpc.id
source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22"]
  }
}



