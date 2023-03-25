variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "App Name"
  type        = string
  default     = "my_project"
}

variable "env" {
  description = "Default tag and prefix for environment"
  type        = string
  default     = "PRD"
}

variable "owner" {
  description = "Default tag for owner"
  type        = string
  default     = "ian"
}

variable "tags" {
  description = "Default tags"
  type        = map(any)
  default = {
    Env   = "prd"
    Owner = "ian"
  }
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "prd_Network"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Public subnets CIDR Block"
  type        = list(any)
  default     = ["192.168.0.0/22", "192.168.4.0/22"]
}

variable "private_subnets_cidr" {
  description = "Private subnets CIDR Block"
  type        = list(any)
  default     = ["192.168.8.0/22", "192.168.12.0/22"]
}

variable "az_list" {
  description = "Availability Zone list"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "igw-prd"
}

variable "nat_gw_name" {
  description = "NAT Gateway name"
  type        = string
  default     = "nat_gw-prd"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "desired_count_service" {
  description = "Desired count service"
  type        = number
  default     = 1
}