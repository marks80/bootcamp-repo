##############################
# Terraform Configuration
##############################
terraform {
  # Specify required providers and their versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # Use the AWS provider version 5.x
    }
  }

  # Minimum required version of Terraform
  required_version = ">= 1.2.0"
}

##############################
# AWS Provider Setup
##############################
provider "aws" {
  # Set the AWS region to deploy your resources
  region = "eu-north-1"
}

##############################
# Variables
##############################

# 1) instance_name variable
variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "MarksSaulevicsLab3"
}

# 2) ingress_rules variable
variable "ingress_rules" {
  description = "List of ingress rules"
  # Each item in the list is an object with specific fields
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))

  # Default ingress rules: SSH (port 22) and HTTP (port 80)
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
    },
    {
      # Notice there's a "type" key in this second object, but it's not directly used in the SG fields
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP access"
    },
  ]
}

##############################
# Data Source: AWS AMI
##############################
data "aws_ami" "ubuntu" {
  # Grab the most recent Amazon-owned Ubuntu AMI matching given filters
  most_recent = true
  owners      = ["amazon"]

  # Filter by AMI name to find Ubuntu Jammy 22.04 server images
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  # Filter to ensure we're getting HVM virtualization type
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

##############################
# Security Group
##############################
resource "aws_security_group" "instance_sg" {
  # name_prefix allows AWS to generate a final name with a random suffix
  name_prefix = "instance_sg"
  description = "Security group for EC2 instance"

  # Use dynamic blocks to create multiple ingress rules from the list variable
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      # Each ingress rule is populated by the list of objects in var.ingress_rules
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  # Egress rule: allow all outbound traffic from this security group
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  # Tag to identify the SG in AWS console
  tags = {
    Name = "MarksSaulevicsLab3"
  }
}

##############################
# EC2 Instance
##############################
resource "aws_instance" "app_server" {
  # Use the ID of the Ubuntu AMI retrieved from the data source
  ami           = data.aws_ami.ubuntu.id
  # Instance type: t3.micro (small & cost-effective)
  instance_type = "t3.micro"

  # ID of the subnet where the instance will reside (must exist in your VPC)
  subnet_id     = "subnet-09cc1026f668efeda"

  # Attach the newly created security group to this instance
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  # Run a user data script from local file "script.sh"
  user_data = file("script.sh")

  # Assign a Name tag based on the "instance_name" variable
  tags = {
    Name = var.instance_name
  }
}

##############################
# Outputs
##############################
output "instance_public_ip" {
  # A description to clarify what this output is
  description = "Public IP of the EC2 instance"

  # Output the instance's public IP address once it's created
  value       = aws_instance.app_server.public_ip
}
