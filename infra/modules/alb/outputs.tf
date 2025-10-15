output "alb_arn" {
  value = aws_lb.this.arn
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.ecs.arn
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}

output "alb_zone_id" {
  value = aws_lb.this.zone_id
}


