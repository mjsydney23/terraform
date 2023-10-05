provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0e812285fd54f7620"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
