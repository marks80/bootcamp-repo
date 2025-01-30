terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09a9858973b288bdd"
  instance_type = "t3.micro"
  subnet_id     = "subnet-09cc1026f668efeda"

  tags = {
    Name = "MarksSaulevics_Terraform_Lab1"
  }
}