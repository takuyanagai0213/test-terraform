# resource "google_container_cluster" "staging_cluster" {
#   name             = "nagai-dev"
#   location         = "asia-northeast1"
#   enable_autopilot = true

#   # min_master_version = "1.24.7-gke.900"

#   # If the issue is resolved in the future, remove ip_allocation_policy block below.
#   # https://github.com/hashicorp/terraform-provider-google/issues/10782
#   ip_allocation_policy {}

#   binary_authorization {
#     evaluation_mode = "DISABLED"
#   }

#   gateway_api_config {
#     channel = "CHANNEL_STANDARD"
#   }
# }

resource "google_secret_manager_secret" "test_workflow_service_account" {
  secret_id = "test-workflow-service-account"

  lifecycle {
    prevent_destroy = true
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "test_workflow_service_account" {
  secret      = google_secret_manager_secret.test_workflow_service_account.id
  secret_data = var.test_workflow_service_account
}

resource "google_service_account" "secret_manager" {
  account_id   = "secret-manager"
  display_name = "secret-manager"
}

resource "google_project_iam_binding" "secret_manager_project_iam_binding" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.secret_manager.email}"
  ]
}

resource "google_service_account_iam_binding" "secret_manager_iam_binding" {
  service_account_id = google_service_account.secret_manager.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[external-secrets/external-secrets-ksa]"
  ]
}
#
