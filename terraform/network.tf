resource "aws_vpc" "lesson9-vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"

  tags = {
    "Name" = "lesson9-vpc"
  }
}

resource "aws_subnet" "lesson9-subnet-public-1" {
  vpc_id                  = aws_vpc.lesson9-vpc.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    "Name" = "lesson9-subnet-public-1"
  }
}

resource "aws_subnet" "lesson9-subnet-public-2" {
  vpc_id                  = aws_vpc.lesson9-vpc.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    "Name" = "lesson9-subnet-public-2"
  }
}

resource "aws_subnet" "lesson9-subnet-public-3" {
  vpc_id                  = aws_vpc.lesson9-vpc.id
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1c"

  tags = {
    "Name" = "lesson9-subnet-public-3"
  }
}

resource "aws_internet_gateway" "lesson9-igw" {
  vpc_id = aws_vpc.lesson9-vpc.id

  tags = {
    "Name" = "lesson9-igw"
  }
}

resource "aws_route_table" "lesson9-public-crt" {
  vpc_id = aws_vpc.lesson9-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lesson9-igw.id
  }

  tags = {
    Name = "lesson9-public-crt"
  }
}

resource "aws_route_table_association" "lesson9-crta-public-subnet-1" {
  subnet_id      = aws_subnet.lesson9-subnet-public-1.id
  route_table_id = aws_route_table.lesson9-public-crt.id
}

resource "aws_route_table_association" "lesson9-crta-public-subnet-2" {
  subnet_id      = aws_subnet.lesson9-subnet-public-2.id
  route_table_id = aws_route_table.lesson9-public-crt.id
}

resource "aws_route_table_association" "lesson9-crta-public-subnet-3" {
  subnet_id      = aws_subnet.lesson9-subnet-public-3.id
  route_table_id = aws_route_table.lesson9-public-crt.id
}

resource "aws_security_group" "lesson9-all" {
  vpc_id = aws_vpc.lesson9-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "lesson9-all"
  }
}