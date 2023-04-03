variable "project" {}
variable "region" {
  default = "us-central1"
}

variable "package" {
  default = "strava"
}

variable "bigquery_table" {}
variable "bucket_name" {}

# For the Webhook application
variable "webhook_repo_url" {
  type = string

}
variable "verify_token" {
  type = string
  description = "A random string which the Webhook application uses to create your subscription."
}

variable "pull_repo_url" {}
variable "gcs_to_gcp_repo_url" {}
