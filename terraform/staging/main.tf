resource "google_storage_bucket" "default" {
  name          = "terraform_terraform-dev-abcd-state"
  location      = "US"
  force_destroy = false
}

resource "google_pubsub_topic" "test_topic" {
  kms_key_name               = null
  labels                     = {}
  message_retention_duration = null
  name                       = "test-topic"
  project                    = "terraform-dev-abcd"
}

resource "google_secret_manager_secret" "test_secret" {
  secret_id = "test-secret"


  lifecycle {
    prevent_destroy = true
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "test" {
  secret = google_secret_manager_secret.test_secret.id
  secret_data = jsonencode(var.test_secret)
}

resource "google_service_account" "external_secrets" {
  account_id   = "external-secrets"
  display_name = "external-secrets"
}

resource "google_project_iam_member" "external_secrets" {
  project = var.project_id
  for_each = toset([
    "roles/secretmanager.secretAccessor",
  ])
  role   = each.key
  member = "serviceAccount:${google_service_account.external_secrets.email}"
}
