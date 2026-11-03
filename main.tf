terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

locals {
  
  project = "project-01"
}

# # VPC creation

resource "aws_vpc" "my-vpc" {
  
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

# # Create subnet

resource "aws_subnet" "main" {
  
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
 count = 2
  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}

output "aws_subnet_id" {
    value = aws_subnet.main[0].id
}

# # craete 4 EC2 instance

resource "aws_instance" "main" {
  
  for_each = var.ec2_map

  # we will get each.key and each.value
   ami = each.value.ami                     
  instance_type = each.value.instance_type
  subnet_id = element(aws_subnet.main[*].id , index(keys(var.ec2_map ),each.key) % length(aws_subnet.main))
  
 tags = {
   Name = "${local.project}-instance-${each.key}"
 }
}

output "subnet_id" {
  
  value = aws_subnet.main[1].id
}