resource "google_cloudbuild_trigger" "pull" {
  name = "${var.package}-pull"

  trigger_template {
    repo_name = var.pull_repo_url
    branch_name = ".*"
  }

  build {
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = [
        "functions",
        "deploy",
        "${google_cloudfunctions_function.pull.name}",
        "--source=."]
    }
  }
}
