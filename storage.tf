resource "google_storage_bucket" "bucket" {
  name = var.bucket_name

  bucket_policy_only = true

  labels = {
    name    = "${var.package}"
    package = "${var.package}"
  }
}
