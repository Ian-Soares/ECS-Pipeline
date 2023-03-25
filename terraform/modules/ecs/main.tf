resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-${var.env}"
}

resource "aws_ecs_task_definition" "ecs-task" {
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  family                   = "ecs-${var.app_name}"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "cpu": 10,
    "environment": [],
    "essential": true,
    "image": "${var.container_image}",
    "name": "${var.app_name}",
    "portMappings": [
      {
        "containerPort": ${var.container_port},
        "hostPort": ${var.container_port}
      }
    ]
  }
]
TASK_DEFINITION
}

resource "aws_ecs_service" "ecs-service" {
  name                               = "${var.app_name}-service"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.ecs-task.arn
  desired_count                      = var.desired_count_service
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [var.sg_ecs_tasks_id]
    subnets          = [var.private_subnet_ids.0, var.private_subnet_ids.1]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.id
    container_name   = var.app_name
    container_port   = var.container_port
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}
