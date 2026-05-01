output "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state."
  value       = aws_s3_bucket.tf_state.id
}

output "lock_table_name" {
  description = "Name of the DynamoDB lock table."
  value       = aws_dynamodb_table.tf_lock.name
}

output "terraform_state_role_arn" {
  description = "ARN of the Terraform state role."
  value       = aws_iam_role.terraform_state_role.arn
}

