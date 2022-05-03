variable "ec2_ami" {
  type = string
}
variable "ec2_instance_type" {
  type = string
}

variable "ec2_common_tags" {
  description = "Common tags for all resurces"
  type        = map(any)
  default = {
    Owner      = "Vasile Cazacu"
    Project    = "Internship"
    CostCenter = "12345"
  }
}