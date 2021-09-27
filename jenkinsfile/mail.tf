terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      profile = "default"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "tf-tarining"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.10.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "my_nic" {
  subnet_id       = aws_subnet.my_subnet.id
  private_ips     = ["10.10.0.50"]
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c1a7f89451184c8b" # ap-south-1
  instance_type = "t2.micro"


  network_interface {
    network_interface_id = aws_network_interface.my_nic.id
    device_index         = 0
 }

  credit_specification {
    cpu_credits = "unlimited"
  }
} 