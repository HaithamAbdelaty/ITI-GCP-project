resource "google_compute_instance" "My-Private-VM" {
  name         = "private-vm"
  machine_type = "n1-standard-8"
  zone         = "us-central1-c"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      
    }
  }
  network_interface {
    network = google_compute_network.working-vpc.id
    subnetwork  = google_compute_subnetwork.management-subnet.id
  }

  service_account {
    email = google_service_account.vm-service-account.email
    scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  metadata_startup_script = " echo hello/hello.txt"

}
