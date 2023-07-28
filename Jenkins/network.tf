resource "aws_vpc" "vpc1" {
  cidr_block           = var.VPC_CIDR_BLOCK
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.PROJECT_NAME}_vpc1"
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_subnet" "cidr1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.AZ_CIDR_BLOCK
  map_public_ip_on_launch = "true"
  availability_zone       = var.AZ1

  tags = {
    Name        = "${var.PROJECT_NAME}_cidr1"
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_internet_gateway" "gw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name        = "${var.PROJECT_NAME}_gw1"
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw1.id
  }

  tags = {
    Name        = "${var.PROJECT_NAME}_rt1"
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_route_table_association" "cidr1-rt1" {
  subnet_id      = aws_subnet.cidr1.id
  route_table_id = aws_route_table.rt1.id
}