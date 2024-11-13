terraform {
  backend "gcs" {
    bucket  = "terraform_terraform-dev-abcd-state"
    prefix  = "terraform/state"
  }
}
