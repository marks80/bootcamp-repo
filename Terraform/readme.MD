
# Terraform Tasks

1. Create a basic .tf which launches an EC2 AWS instance.
2. Update the existing configuration by adding:
	* A data block for AMI to avoid hardcoding;
	* Dependencies to attach an EC2 instance to a created security group;
	* Variables & create an output, that shows the EC2 public IP after deployment.
3. Modify the configuration with:
	* A built-in function (e.g. filebase64 for ec2 userdata);
	* Dynamic block/s.
	
# Homework Task
HOMEWORK Breakdown:
1. Networking:
	- VPC:
		- Use a default VPC with the CIDR block of 10.0.0.0/16.
		- Create two subnets:
		- A public subnet in 10.0.1.0/24.
		- A private subnet in 10.0.2.0/24.
	- Create an Internet Gateway and attach it to the VPC for the public subnet to have internet access.
	- Route Tables:
		- Create a route table for the public subnet and add a route to the Internet Gateway.
		- Associate the public subnet with this route table.
		- The private subnet should not have internet access.
2. EC2 Module:
	- Create a Terraform Module for EC2 Instances:
	- Create a module called ec2_instances that will deploy:
		- Two EC2 instances in the public subnet.
		- The EC2 instances should use user data to install and start a basic Apache HTTP server.
	- A security group allowing:
		- SSH (port 22) from your IP address.
		- HTTP (port 80) from any IP address.
3. Module Input Variables:
	- The module should accept input variables for:
		- Instance type (default).
		- Key pair name (for SSH access).
		- The public subnet ID.
	- Call the EC2 Module in Main Configuration:
	- In your main configuration file (main.tf), call the ec2_instances module and pass the appropriate parameters for the instance type, key pair name, and subnet ID.

