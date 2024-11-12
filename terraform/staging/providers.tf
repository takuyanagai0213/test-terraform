provider "google" {
  credentials = file("./credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

terraform {
  required_version = "1.9.8"
}
