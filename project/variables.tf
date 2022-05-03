#================Region===========================
variable "root_region" {
  type = string
}
# ==================VPC_Cidr_Block_10.0.0.0/16==================
variable "root_vpc_cidr_block" {
  type = string
}
#===================Public_Cidr_Block_10.0.x.0/24=============
variable "root_public_cidr_bloc" {
  type = list(string)
}
#===================Public_Cidr_Block_10.0.y.0/24=============
variable "root_private_cidr_bloc" {
  type = list(string)
}
#===================Open_Cidr_Block_0.0.0.0/0=============
variable "root_open_cidr_block" {
   type = string
}
variable "root_allow_ports" {
  type = list(string)
}
variable "root_ami" {
  type = string
}
variable "root_instance_type" {
  type = string
}
