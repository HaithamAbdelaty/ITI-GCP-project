resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"

  ip_cidr_range = "10.0.0.0/22"
  region   =working-vpc.region.id

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = google_compute_network.working-vpc.id
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"

  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = google_compute_network.working-vpc.id
}
