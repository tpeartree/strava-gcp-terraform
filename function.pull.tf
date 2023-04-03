resource "google_cloudfunctions_function" "pull" {
  name = "${var.package}-get-activity"
  runtime = "python37"
  available_memory_mb = 128
  source_repository {
    url = var.pull_repo_url
  }
  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource = google_pubsub_topic.webhook.name
  }
  entry_point = "get_activity"
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
