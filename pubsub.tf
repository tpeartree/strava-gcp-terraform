resource "google_pubsub_topic" "webhook" {
  name = "${var.package}-webhook"
}
