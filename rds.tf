## Create Database Subnet Group
## terraform aws db subnet group
#resource "aws_db_subnet_group" "database-subnet-group" {
#  name        = "database subnets"
#  subnet_ids  = [aws_subnet.yorkPrivateSubnet3.id, aws_subnet.yorkPrivateSubnet4.id]
#  description = "Subnets for Database Instance"
#
#  engine            = "mysql"
#  engine_version    = "5.7.25"
#  allocated_storage = 5
#
#  db_name  = "demodb"
#  username = "user"
#  port     = "3306"
#
#  iam_database_authentication_enabled = true
#  vpc_security_group_ids              = [aws_security_group.yorkdatabase-security-group.id]
#
#  tags = {
#    Name = "Database Subnets"
#  }
#}