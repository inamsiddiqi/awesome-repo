resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "tf-tarining"
  }
}

resource "aws_subnet" "tf_subnet" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.cidr_subnet 
  availability_zone = var.subnet_az

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "tf_nic" {
  subnet_id       = aws_subnet.tf_subnet.id
  private_ips     = [var.ip_nic] 

  tags = {
    Name = "primary_network_interface"
  }
}