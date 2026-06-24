provider "aws" {
  region = var.aws_region
}

module "training_bucket" {
  source = "./modules/tagged-s3-bucket"

  environment_name = var.environment_name
  name_prefix      = var.name_prefix
  tags = {
    ManagedBy = "terraform"
    Lesson    = "iac-tooling"
  }
}

