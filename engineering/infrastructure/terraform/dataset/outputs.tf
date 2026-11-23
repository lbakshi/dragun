output "bucket_name" {
  description = "Name of the dataset bucket."
  value       = aws_s3_bucket.dataset.id
}

output "bucket_arn" {
  description = "ARN of the dataset bucket."
  value       = aws_s3_bucket.dataset.arn
}

output "aws_profile" {
  description = "AWS profile used to access the bucket."
  value       = var.aws_profile
}

output "aws_region" {
  description = "AWS region of the bucket."
  value       = var.aws_region
}
