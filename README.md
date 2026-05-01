# Terraform Bootstrap (Shared Services)

This project creates shared Terraform remote state infrastructure:

- S3 bucket for remote state files
- DynamoDB table for state locking

## Usage

1. Copy vars file:

   cp terraform.tfvars.example terraform.tfvars

2. Edit `terraform.tfvars` with your values.

3. Run bootstrap:

   terraform init
   terraform plan
   terraform apply

4. Configure other projects to use this backend:

   terraform {
     backend "s3" {
       bucket         = "<state_bucket_name>"
       key            = "env/project/terraform.tfstate"
       region         = "<region>"
       dynamodb_table = "<lock_table_name>"
       encrypt        = true
     }
   }

## Notes

- Do not configure an S3 backend in this bootstrap stack until after first apply.
- Keep this stack simple and stable; all other stacks depend on it.
# dvaws-bootstrap
