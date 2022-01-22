provider "aws" {
  region = "eu-central-1"
}

#terraform backend
terraform {
  backend "s3" {
    bucket         = "ganjasan-terragrunt-example-1"
    key            = "prod/vpc/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "ganjasan-terragrunt-example-backend-lock-1"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE MYSQL DB
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_db_instance" "mysql" {
  engine         = "mysql"
  engine_version = "5.6.41"

  name     = var.db_name
  username = var.master_username
  password = var.master_password

  instance_class    = var.db_instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  # TODO: DO NOT COPY THIS SETTING INTO YOUR PRODUCTION DBS. It's only here to make testing this code easier!
  skip_final_snapshot = true
}