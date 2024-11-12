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

variable "terraform_sa_roles" {
  description = "Terraform SA Roles"
  type        = list(string)
  default = [
    "roles/editor",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/secretmanager.admin",
    "roles/iam.workloadIdentityPoolAdmin",
  ]
}
# variable "test_workflow_service_account" {
#   type = string

#   sensitive = true
# }

variable "test_secret" {
  type = map(string)
  # default = {
  #   username = "admin"
  #   password = "admin"
  # }
}
