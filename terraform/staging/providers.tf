provider "google" {
  credentials = file("./credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }

  required_version = "1.1.7"
}
