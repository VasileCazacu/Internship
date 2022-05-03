#=============================== VPC ==========================
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_vpc_cidr_block

  tags = merge(var.vpc_common_tags, { Name = "Cloud_Internship" })
  
}
#=============================== IGW ==========================
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(var.vpc_common_tags, { Name = "my_IGW" })
}
#=============================== Route_table ==========================
resource "aws_route_table" "my_RT_public" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = var.vpc_open_cidr_block
        gateway_id = aws_internet_gateway.my_igw.id
    }
    tags = merge(var.vpc_common_tags, {Name = " RT_Public_Subnet."})
}

resource "aws_route_table_association" "my_RT_public" {
    count = length(aws_subnet.public_subnet[*].id)
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index)
    route_table_id = aws_route_table.my_RT_public.id
}
#=============================== public_subnet ==========================
resource "aws_subnet" "public_subnet" {
  count      = length(var.vpc_public_cidr_block)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.vpc_public_cidr_block, count.index)

   tags = merge(var.vpc_common_tags, {Name = "Public_Subnet ${count.index +1}" })
}
#=============================== private_subnet ==========================
resource "aws_subnet" "private_subnet" {
  count      = length(var.vpc_private_cidr_block)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.vpc_private_cidr_block, count.index)

  tags = merge(var.vpc_common_tags, {Name = "Private_Subnet ${count.index +1}" })
}
#=============================== Security_Group ==========================
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.vpc_allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_open_cidr_block]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.vpc_open_cidr_block]
  }

  tags = merge(var.vpc_common_tags, { Name = "Allow_TLS" })
}