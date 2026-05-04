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

variable "account_id_cicd" {
  description = "AWS account ID for the CI/CD account that can assume the Terraform state role."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for creating VPC endpoints (optional, for private access)."
  type        = string
  default     = ""
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for DynamoDB interface endpoint (optional)."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common tags to apply to all bootstrap resources."
  type        = map(string)
  default     = {}
}
