provider "aws" {
  region  = "eu-west-1"
}

module "production-tfstate" {
  source = "../../modules/terraform-state"
  env = "production"
  s3_bucket = "nabil-production-terraform-state"
  s3_bucket_name = "Nabil Production terraform state store"
}