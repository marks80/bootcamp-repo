# -------------------
# Terraform Settings
# -------------------
terraform {
  # Specify which providers (and versions) your configuration depends on
  required_providers {
    aws = {
      # The AWS provider plugin comes from HashiCorp
      source  = "hashicorp/aws"
      # Use version 5.x (and automatically allow patch/minor updates)
      version = "~> 5.0"
    }
  }

  # Require at least version 1.2.0 of Terraform to run this configuration
  required_version = ">= 1.2.0"
}

# -------------------
# AWS Provider Block
# -------------------
provider "aws" {
  # Set the AWS region to deploy resources into
  region = "eu-north-1"
}

# -------------------
# EC2 Instance Resource
# -------------------
resource "aws_instance" "app_server" {
  # The AMI (Amazon Machine Image) to use for the instance
  # ami-09a9858973b288bdd is Ubuntu image
  ami           = "ami-09a9858973b288bdd"

  # The EC2 instance type (t3.micro is small and cost-effective)
  instance_type = "t3.micro"

  # The subnet into which this EC2 instance will be launched
  # This subnet must exist in the same VPC you're using
  subnet_id     = "subnet-09cc1026f668efeda"

  # Assign a "Name" tag to help identify this EC2 instance in the AWS console
  tags = {
    Name = "MarksSaulevics_Terraform_Lab1"
  }
}
