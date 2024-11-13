resource "google_storage_bucket" "default" {
  name          = "terraform_terraform-dev-abcd-state"
  location      = "US"
  force_destroy = false
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "my-custom-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

# __generated__ by Terraform from "projects/terraform-dev-abcd/topics/test-topic"
resource "google_pubsub_topic" "test_topic" {
  kms_key_name               = null
  labels                     = {}
  message_retention_duration = null
  name                       = "test-topic"
  project                    = "terraform-dev-abcd"
}

# resource "google_secret_manager_secret" "test_secret" {
#   secret_id = "test-secret"
#
#
#   lifecycle {
#     prevent_destroy = true
#   }
#
#   replication {
#     auto {}
#   }
# }
#
# resource "google_secret_manager_secret_version" "test" {
#   secret = google_secret_manager_secret.test_secret.id
#   secret_data = jsonencode(var.test_secret)
# }
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

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
