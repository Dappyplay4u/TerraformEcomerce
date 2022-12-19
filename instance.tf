# use data source to get a registered amazon linux 2 ami
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "webserver-Instance1" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.yorkwebserver-security-group.id]
  subnet_id              = aws_subnet.yorkPublicSubnet1.id
  key_name = "newlycreated1"
  user_data              = file("installtechmax.sh")


  tags = {
    Name        = "Web-Server1"
    Environment = "dev"
  }
}

resource "aws_network_interface" "main_network_interface1" {
  subnet_id   = aws_subnet.yorkPublicSubnet1.id

  tags = {
    Name = "main_network_interface1"
  }
}

resource "aws_instance" "webserver-Instance2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.yorkwebserver-security-group.id]
  subnet_id              = aws_subnet.yorkPublicSubnet2.id
  key_name = "newlycreated1"
  user_data              = file("installtechmax.sh")

  tags = {
    Name        = "Web-Server2"
    Environment = "dev"
  }
}
resource "aws_network_interface" "main_network_interface2" {
  subnet_id   = aws_subnet.yorkPublicSubnet2.id

  tags = {
    Name = "main_network_interface2"
  }
}

resource "aws_instance" "webserver-Instance3" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.yorkwebserver-security-group.id]
  subnet_id              = aws_subnet.yorkPrivateSubnet1.id

  tags = {
    Name        = "app_Sever1"
    Environment = "dev"
  }
}
resource "aws_network_interface" "main_network_interface3" {
  subnet_id   = aws_subnet.yorkPrivateSubnet1.id

  tags = {
    Name = "main_network_interface3"
  }
}

resource "aws_instance" "webserver-Instance4" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.yorkwebserver-security-group.id]
  subnet_id              = aws_subnet.yorkPrivateSubnet2.id

  tags = {
    Name        = "app_Sever2"
    Environment = "dev"
  }
}
resource "aws_network_interface" "main_network_interface4" {
  subnet_id   = aws_subnet.yorkPrivateSubnet2.id

  tags = {
    Name = "main_network_interface4"
  }
}
