
terraform {
  required_providers {
    aws = {
        source ="hashicorp/aws"
        version = "~>4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA26XITUEDHSMTFHV5"
    secret_key = "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"
}

resource "aws_vpc" "vishnuvpc" {
 cidr_block = "10.0.1.0/24"
 tags = {
 Name = "teraformVPC"
 }
}
resource "aws_subnet" "subnet-1" {
 vpc_id = aws_vpc.vishnuvpc.id
 cidr_block = "10.0.1.0/25"
 map_public_ip_on_launch = true
 availability_zone = "us-east-1a"
 tags = {
 Name = "Sub-1=terraform"
 }
}
resource "aws_security_group" "sg" {
 vpc_id = aws_vpc.vishnuvpc.id
 ingress {
 from_port = 22
 protocol = "tcp"
 to_port = 22
 cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
 from_port = 22
 protocol = "tcp"
 to_port = 22
 cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_internet_gateway" "igw1" {
 vpc_id = aws_vpc.vishnuvpc.id
}
resource "aws_route_table" "route_table" {
 vpc_id = aws_vpc.vishnuvpc.id
}
resource "aws_route_table_association" "rou-asso" {
 route_table_id = aws_route_table.route_table.id
 subnet_id = aws_subnet.subnet-1.id
}
resource "aws_route" "route" {
 route_table_id = aws_route_table.route_table.id
 gateway_id = aws_internet_gateway.igw1.id
 destination_cidr_block = "0.0.0.0/0"
}
resource "aws_instance" "ec2" {
 ami = "ami-006dcf34c09e50022"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.subnet-1.id
 vpc_security_group_ids = [aws_security_group.sg.id]
}
