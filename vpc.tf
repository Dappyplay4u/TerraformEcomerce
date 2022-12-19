
# Create VPC
# terraform aws create vpc
resource "aws_vpc" "yorkvpc" {
  cidr_block           = var.yorkvpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "york VPC"
  }
}


# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "yorkPublicSubnet1" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPublicSubnet1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "yorkpublic-subnet1"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "yorkPublicSubnet2" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPublicSubnet2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "yorkpublic-subnet2"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "yorkinternet-gateway" {
  vpc_id = aws_vpc.yorkvpc.id

  tags = {
    Name = "york IGW"
  }
}

#INTERNET GATEWAY ROUTE TABLE
resource "aws_route_table" "york_internet_gateway_route_table" {
  vpc_id = aws_vpc.yorkvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.yorkinternet-gateway.id
  }
  tags = {
    Name = "DEV-Internetgtway-routetable"
  }
}
#ROUTE TABLE ATTACHMENT
# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table_association" "yorkpublicsubnet1_RT" {
  subnet_id      = aws_subnet.yorkPublicSubnet1.id
  route_table_id = aws_route_table.york_internet_gateway_route_table.id
}
resource "aws_route_table_association" "yorkpublicsubnet2_RT" {
  subnet_id      = aws_subnet.yorkPublicSubnet2.id
  route_table_id = aws_route_table.york_internet_gateway_route_table.id
}

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "yorkPrivateSubnet1" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPrivateSubnet1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "yorkPrivate-Subnet1"
  }
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "yorkPrivateSubnet2" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPrivateSubnet2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "yorkPrivate-subnet2"
  }
}

# Create Private Subnet 3
# terraform aws create subnet
resource "aws_subnet" "yorkPrivateSubnet3" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPrivateSubnet3-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "yorkPrivate-Subnet3"
  }
}

# Create Private Subnet 4
# terraform aws create subnet
resource "aws_subnet" "yorkPrivateSubnet4" {
  vpc_id                  = aws_vpc.yorkvpc.id
  cidr_block              = var.yorkPrivateSubnet4-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "yorkPrivate-Subnet4"
  }
}