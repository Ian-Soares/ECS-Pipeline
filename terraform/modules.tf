module "networking" {
  source = "./modules/networking"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets_cidr
  private_subnets = var.private_subnets_cidr
  az_list         = var.az_list
  tags            = var.tags
  igw_name        = var.igw_name
  nat_gw_name     = var.nat_gw_name
}

module "security" {
  source = "./modules/security"

  vpc_id         = module.networking.vpc_id
  container_port = var.container_port
  app_name       = var.app_name
  env            = var.env
}

module "repository" {
  source = "./modules/ecr"

  tags     = var.tags
  app_name = var.app_name
  env      = var.env
}

module "ecs_cluster" {
  source = "./modules/ecs"

  app_name              = var.app_name
  vpc_id                = module.networking.vpc_id
  env                   = var.env
  public_subnet_ids     = module.networking.public_subnet_ids
  private_subnet_ids    = module.networking.private_subnet_ids
  container_image       = module.repository.container_image
  container_port        = var.container_port
  task_role_arn         = module.security.task_role_arn
  execution_role_arn    = module.security.execution_role_arn
  desired_count_service = var.desired_count_service
  alb_sg_id             = module.security.alb_sg_id
  sg_ecs_tasks_id       = module.security.sg_ecs_tasks_id
}

