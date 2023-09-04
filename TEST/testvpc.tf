provider "aws" {
  region = "ap-northeast-3"
}

data "aws_availability_zones" "available" {
  state = "available"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "200.200.0.0/24"
}

variable "tag" {
  default     = "Terraform"
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag}-VPC"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "200.200.0.0/27"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.tag}-Subnet"
  }
}

resource "aws_subnet" "main_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "200.200.0.32/27"
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.tag}-Subnet2"
  }
}

resource "aws_subnet" "main_subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "200.200.0.64/27"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.tag}-Subnet3"
  }
}