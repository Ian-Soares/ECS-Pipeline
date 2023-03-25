variable "vpc_name" {
  description = "VPC Name"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
}

variable "public_subnets" {
  description = "Public subnets CIDR Block"
}

variable "private_subnets" {
  description = "Private subnets CIDR Block"
}

variable "igw_name" {
  description = "Internet Gateway name"
}

variable "nat_gw_name" {
  description = "NAT Gateway name"
}

variable "tags" {
  description = "Resources default tags"
}

variable "az_list" {
  description = "Availability Zone list"
}
