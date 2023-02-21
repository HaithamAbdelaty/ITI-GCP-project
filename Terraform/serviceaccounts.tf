resource "google_service_account" "vm-service-account" {
  account_id   = "haithem56929"
  display_name = "VM ServiceAccount"
}

resource "google_project_iam_member" "vm-service-account-role" {
  project = "haithem56929"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.vm-service-account.email}"
}

