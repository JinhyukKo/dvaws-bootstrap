resource "aws_iam_role" "terraform_state_role" {
  name = "TerraformStateAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id_cicd}:root" # jinhyukcicd account ID
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}