resource "google_service_account" "vm-service-account" {
  account_id   = "vm-machine-service-account"
  display_name = "VM Service Account"
}

resource "google_project_iam_member" "vm-service-account-role" {
  project = "haithem56929"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.vm-service-account.email}"
}

resource "google_service_account" "GKE-service-account" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}

resource "google_project_iam_member" "GKE-service-account-role" {
  project = "haithem56929"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.GKE-service-account.email}"
}

