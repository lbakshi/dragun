variable "bucket_name" {
  description = "Globally unique name for the private dataset bucket."
  type        = string

  validation {
    condition     = var.bucket_name != "replace-with-a-globally-unique-dataset-bucket-name"
    error_message = "Set bucket_name in the shared terraform.tfvars before planning."
  }
}
