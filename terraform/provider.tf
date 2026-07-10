provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-landing-zone"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Sairam"
    }
  }
}
