terraform {
  backend "s3" {
    bucket         = "nabil-production-terraform-state"
    key            = "production/terraform.state"
    region         = "eu-west-1"
    encrypt        = true
    # kms_key_id     = "alias/terraform"
    # dynamodb_table = "terraform_production"
  }
}
