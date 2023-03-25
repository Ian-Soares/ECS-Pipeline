data "aws_lb" "alb" {
  arn = aws_lb.main.arn
}

output "alb_dns_name" {
  value = data.aws_lb.alb.dns_name
}