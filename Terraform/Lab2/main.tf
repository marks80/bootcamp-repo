###################################
# Terraform Configuration Settings
###################################
terraform {
  # Specify which providers (and versions) your configuration depends on
  required_providers {
    aws = {
      # The AWS provider plugin from HashiCorp, version 5.x
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Require Terraform v1.2.0 or higher
  required_version = ">= 1.2.0"
}

###################################
# AWS Provider Configuration
###################################
provider "aws" {
  # The AWS region to deploy into
  region = "eu-north-1"
}

###################################
# Input Variable
###################################
variable "instance_name" {
  # Description of the variable for clarity
  description = "Name tag for the EC2 instance"

  # Data type is string
  type        = string

  # Default value used if none is provided
  default     = "MarksSaulevics_Terraform_Lab2"
}

###################################
# Data Source: AWS AMI (Ubuntu)
###################################
data "aws_ami" "ubuntu" {
  # Grab the most recent Ubuntu AMI from the 'amazon' owner
  most_recent = true
  owners      = ["amazon"]

  # Filter by name to match Ubuntu Jammy 22.04 HVM images
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  # Filter by virtualization type HVM
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

###################################
# Security Group for EC2 Instance
###################################
resource "aws_security_group" "instance_sg" {
  # Name prefix, AWS will append random string to ensure uniqueness
  name_prefix = "instance_sg"

  # Brief description
  description = "Security group for EC2 instance"

  # Inbound Rules (ingress)
  ingress {
    # Allow SSH from anywhere (adjust to your own IP range in production)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  # Outbound Rules (egress)
  egress {
    # Allow all outbound traffic to anywhere
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  # Tag to identify the SG in AWS Console
  tags = {
    Name = "MarksSaulevics_Terraform_Lab2"
  }
}

###################################
# EC2 Instance
###################################
resource "aws_instance" "app_server" {
  # Use the Ubuntu AMI found by the data source above
  ami           = data.aws_ami.ubuntu.id

  # Choose a small, cost-effective instance type
  instance_type = "t3.micro"

  # Hardcode a specific subnet ID where this instance will live
  subnet_id = "subnet-09cc1026f668efeda"
  
  # Attach the security group defined above
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  
  # Use the variable "instance_name" for the Name tag
  tags = {
    Name = var.instance_name
  }
}

###################################
# Outputs
###################################
output "instance_public_ip" {
  # Description of the output
  description = "Public IP of the EC2 instance"

  # Show the public IP of our newly created EC2 instance
  value       = aws_instance.app_server.public_ip
}
