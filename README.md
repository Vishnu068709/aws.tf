# Terraform script provisions a basic AWS infrastructure:

Provider Configuration: Specifies AWS as the provider with access credentials and version.
VPC Creation: Defines a Virtual Private Cloud (VPC) named "terraformVPC" with a CIDR block of 10.0.1.0/24.
Subnet Setup: Creates a subnet within the VPC with CIDR block 10.0.1.0/25, enabling automatic public IP assignment and associating it with us-east-1a availability zone.
Security Group: Establishes a security group allowing inbound and outbound traffic on TCP port 22 (SSH) from any IP address.
Internet Gateway: Adds an internet gateway to the VPC for internet access.
Route Table Configuration: Sets up a route table associated with the VPC.
Route Table Association: Associates the previously defined subnet with the route table.
Routing Configuration: Defines a route in the route table directing traffic destined for any IP address (0.0.0.0/0) to the internet gateway.
EC2 Instance Creation: Launches an EC2 instance using the specified AMI and instance type, placing it within the previously defined subnet, and applying the created security group for network access.




