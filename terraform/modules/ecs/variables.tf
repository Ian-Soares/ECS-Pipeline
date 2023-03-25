variable "vpc_id" {
  description = "VPC ID for ECS cluster"
}

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
}

variable "app_name" {
  description = "App Name"
}

variable "container_port" {
  description = "Container port"
}

variable "container_image" {
  description = "Container image"
}

variable "desired_count_service" {
  description = "Desired count service"
}

variable "execution_role_arn" {
  description = "ARN for execution role"
}

variable "task_role_arn" {
  description = "ARN for task role"
}

variable "env" {
  description = "Resources default prefix / tag"
}

variable "alb_sg_id" {
  description = "Application Load Balancer Security Group ID"
}

variable "sg_ecs_tasks_id" {
  description = "Security Group ECS Tasks ID"
}