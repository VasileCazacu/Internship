output "webserver_public_ip" {
    value = aws_eip.my_static_ip.public_ip
}