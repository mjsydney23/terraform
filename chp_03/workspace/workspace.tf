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
    key    = "workspaces-example/terraform.tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "mjsydney23-terraform-locks"
    encrypt        = true
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0d02292614a3b0df1"
  instance_type = "t2.micro"

  tags = {
    Name = "${terraform.workspace}-instance"
  }
}
