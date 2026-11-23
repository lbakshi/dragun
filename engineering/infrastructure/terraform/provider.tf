variable "aws_region" {
  description = "AWS region for resources."
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile used by the provider."
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID that the provider is allowed to use."
  type        = string
}

provider "aws" {
  region              = var.aws_region
  profile             = var.aws_profile
  allowed_account_ids = [var.aws_account_id]
}
