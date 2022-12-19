# Allocate Elastic IP Address (EIP 1)
# terraform aws allocate elastic ip
resource "aws_eip" "yorkeip-for-nat-gateway-1" {
  vpc = true

  tags = {
    Name = "NijEIP1"
  }
}

# Allocate Elastic IP Address (EIP 2)
# terraform aws allocate elastic ip
resource "aws_eip" "yorkeip-for-nat-gateway-2" {
  vpc = true

  tags = {
    Name = "yorkEIP2"
  }
}

# Create Nat Gateway 1 in Public Subnet 1
# terraform create aws nat gateway
resource "aws_nat_gateway" "yorknat-gateway1" {
  allocation_id = aws_eip.yorkeip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.yorkPublicSubnet1.id

  tags = {
    Name = "yorkNat-gw1"
  }
}

# Create Nat Gateway 2 in Public Subnet 2
# terraform create aws nat gateway
resource "aws_nat_gateway" "yorknat-gateway2" {
  allocation_id = aws_eip.yorkeip-for-nat-gateway-2.id
  subnet_id     = aws_subnet.yorkPublicSubnet2.id

  tags = {
    Name = "yorkNat-gw2"
  }
}

# Create Private Route Table 1 and Add Route Through Nat Gateway 1
# terraform aws create route table
resource "aws_route_table" "yorkPrivateRrouteTable1" {
  vpc_id = aws_vpc.yorkvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.yorknat-gateway1.id
  }

  tags = {
    Name = "yorkNATgw-routetb1"
  }
}

# Associate Private Subnet 1 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "yorkPrivateSubnet1-route-table-association" {
  subnet_id      = aws_subnet.yorkPrivateSubnet1.id
  route_table_id = aws_route_table.yorkPrivateRrouteTable1.id
}

# Associate Private Subnet 3 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "yorkPrivateSubnet3-route-table-association" {
  subnet_id      = aws_subnet.yorkPrivateSubnet3.id
  route_table_id = aws_route_table.yorkPrivateRrouteTable1.id
}

# Create Private Route Table 2 and Add Route Through Nat Gateway 2
# terraform aws create route table
resource "aws_route_table" "yorkPrivateRrouteTable2" {
  vpc_id = aws_vpc.yorkvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.yorknat-gateway2.id
  }

  tags = {
    Name = "yorkNATgw-routetb2"
  }
}

# Associate Private Subnet 2 with "Private Route Table 2"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "yorkPrivateSubnet2-route-table-association" {
  subnet_id      = aws_subnet.yorkPrivateSubnet2.id
  route_table_id = aws_route_table.yorkPrivateRrouteTable2.id
}

# Associate Private Subnet 4 with "Private Route Table 2"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "yorkPrivateSubnet4-route-table-association" {
  subnet_id      = aws_subnet.yorkPrivateSubnet4.id
  route_table_id = aws_route_table.yorkPrivateRrouteTable2.id
}