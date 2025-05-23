# Code to create gcs bucket
# For more info https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "crime_bucket" {
  name          = var.storage_bucket_name
  location      = var.location
  force_destroy = true

  storage_class = var.storage_class

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}