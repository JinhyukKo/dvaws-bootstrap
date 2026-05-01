resource "aws_iam_role" "terraform_state_role" {
  name = "TerraformStateAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::SOURCE_ACCOUNT_ID:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}