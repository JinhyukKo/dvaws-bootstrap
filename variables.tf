variable "region" {
  description = "AWS region for shared services resources."
  type        = string
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform remote state."
  type        = string
}

variable "lock_table_name" {
  description = "DynamoDB table name used for Terraform state locking."
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all bootstrap resources."
  type        = map(string)
  default     = {}
}
