terraform {

  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "mjsydney23-terraform-state"
    key    = "stage/data-store/postgresql/terraform.tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "mjsydney23-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

resource "aws_db_instance" "example" {
  identifier          = "terraform-up-and-running"
  engine              = "postgres"
  instance_class      = "db.t4g.micro"
  allocated_storage   = 5
  engine_version      = "12.11"
  skip_final_snapshot = true
  publicly_accessible = false # this is the default value

  username = var.db_username
  password = var.db_password
}
