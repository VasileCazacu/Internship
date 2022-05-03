variable "vpc_vpc_cidr_block" {
  type = string
}
variable "vpc_public_cidr_block" {
  type = list(string)
}
variable "vpc_private_cidr_block" {
  type = list(string)
}
variable "vpc_allow_ports" {
  type = list(string)
}
variable "vpc_open_cidr_block" {
  type = string
}
variable "vpc_common_tags" {
  description = "Common tags for all resurces"
  type        = map(any)
  default = {
    Owner      = "Vasile Cazacu"
    Project    = "Internship"
    CostCenter = "12345"
  }
}