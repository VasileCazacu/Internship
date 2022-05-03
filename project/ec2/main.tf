resource "aws_instance" "Worldpress_Web" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  
  tags = merge(var.ec2_common_tags, {Name = "Worldpress server"})
}

#===========================Elastic IP=========================================
resource "aws_eip" "my_static_ip" {
    instance = aws_instance.Worldpress_Web.id
    tags = merge(var.ec2_common_tags, {Name = "Server_IP"})
}