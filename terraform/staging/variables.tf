variable "project_id" {
  description = "GCP project id"
  type        = string
}
variable "region" {
  description = "GCP default region"
  type        = string
}
variable "zone" {
  description = "GCP default zone"
  type        = string
}

variable "test_workflow_service_account" {
  type = string

  sensitive = true
}
