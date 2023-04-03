resource "google_cloudbuild_trigger" "webhook" {
  name = "${var.package}-webhook"

  trigger_template {
    repo_name = var.webhook_repo_url
    branch_name = ".*"
  }

  build {
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = [
        "functions",
        "deploy",
        "${google_cloudfunctions_function.webhook.name}",
        "--source=."]
    }
  }
}
