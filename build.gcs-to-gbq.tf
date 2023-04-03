resource "google_cloudbuild_trigger" "gcs_to_gbq" {
  name = "${var.package}-gcs-to-gbq"

  trigger_template {
    repo_name = var.gcs_to_gcp_repo_url
    branch_name = ".*"
  }

  build {
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = [
        "functions",
        "deploy",
        "${google_cloudfunctions_function.gcs_to_gbq.name}",
        "--source=."]
    }
  }
}
