variable "region" {
type = string 
default = "ap-south-1"
description = "defining the region"
}

variable "vpc_cidr" {
    type = string
    default = "10.10.0.0/16"
    description = "vpc ip rang"
}

variable "cidr_subnet" {
    type = string 
    default = "10.10.0.0/24"
    description = "subnet range"
}

variable "subnet_az" {
    type = string
    default = "ap-south-1a"
    description = "availability of subnet"
}

variable "ip_nic" {
    type = string
    default = "10.10.0.50"
    description = "private ip for network interface"
}

variable "my_ami" {
    type = string
    default = "ami-0c1a7f89451184c8b"
    description = "an ami image"
}

variable "type_instance" {
    type = string
    default = "t2.micro"
    description = "instance type"
}

variable "credits_cpu" {
    type = string
    default = "unlimited"
    description = "cpu credits for the instance"
}