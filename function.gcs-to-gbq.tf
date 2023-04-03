resource "google_cloudfunctions_function" "gcs_to_gbq" {
  name = "${var.package}-gcs-to-gbq"
  runtime = "python37"
  available_memory_mb = 128
  source_repository {
    url = var.gcs_to_gcp_repo_url
  }
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource = google_storage_bucket.bucket.name
  }
  entry_point = "main"
  timeout = 540

  environment_variables = {
    STORAGE_BUCKET_NAME = google_storage_bucket.bucket.name
    BIGQUERY_TABLE      = var.bigquery_table
  }

  labels = {
    package = "${var.package}"
  }

  depends_on = [google_project_service.cloudfunctions, google_project_service.sourcerepo]
}
