terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  region = var.root_region
}
module "vpc" {
  source         = "./vpc"
  vpc_vpc_cidr_block        = var.root_vpc_cidr_block
  vpc_public_cidr_block     = var.root_public_cidr_bloc
  vpc_private_cidr_block    = var.root_private_cidr_bloc
  vpc_open_cidr_block       = var.root_open_cidr_block
  vpc_allow_ports           = var.root_allow_ports
}
module "ec2" {
  source            = "./ec2"
  ec2_ami           = var.root_ami
  ec2_instance_type = var.root_instance_type

}