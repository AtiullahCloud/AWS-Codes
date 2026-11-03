# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 6.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# Create VCP

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

# Private Subnet 

resource "aws_subnet" "Priavte-Subnet" {
  
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "private-subnet"
  }
}

# Public Subnet 

resource "aws_subnet" "Public-Subnet" {
  
  cidr_block = "10.0.2.0/24"

  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "Public-Subnet"
  }
}


# Internet Gateway

resource "aws_internet_gateway" "My-igw" {
  
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "My-igw"
  }
}

# Route Table

resource "aws_route_table" "My-RT" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My-igw.id
  }

tags = {
  Name = "My-RT"
}
}

# Subnet Association

resource "aws_route_table_association" "RT-Public-association" {
  
 route_table_id = aws_route_table.My-RT.id
 subnet_id = aws_subnet.Public-Subnet.id

}