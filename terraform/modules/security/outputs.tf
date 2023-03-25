output "alb_sg_id" {
  value = aws_security_group.alb-sg.id
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "sg_ecs_tasks_id" {
  value = aws_security_group.ecs_tasks.id
}