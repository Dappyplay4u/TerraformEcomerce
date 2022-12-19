output "instanceidwebserver1" {
  value = aws_instance.webserver-Instance1.id

}

output "instanceidwebserver2" {
  value = aws_instance.webserver-Instance2.id

}

output "publicipwebserver1" {
  value = aws_instance.webserver-Instance1.public_ip
}

output "publicipwebserver2" {
  value = aws_instance.webserver-Instance2.public_ip
}

output "privateipwebserver1" {
  value = aws_instance.webserver-Instance3.private_ip
}

output "privateipwebserver2" {
  value = aws_instance.webserver-Instance4.private_ip
}

# print the url of the server
output "main_web_server2_ipv4_url" {
  value = join("", ["http://", aws_instance.webserver-Instance1.public_ip])
}

# print the url of the server
output "main_web_server1_ipv4_url" {
  value = join("", ["http://", aws_instance.webserver-Instance2.public_ip])
}
