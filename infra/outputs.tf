# ─────────────────────────────── Network Outputs ───────────────────────────────
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "availability_zones" {
  description = "Availability zones used"
  value       = module.network.azs
}

# ─────────────────────────────── ECS Outputs ───────────────────────────────
output "ecs_cluster_name" {
  value       = module.ecs.cluster_name
  description = "Name of the ECS cluster"
}

output "ecs_task_definition_arn" {
  value       = module.ecs.task_definition_arn
  description = "ECS task definition ARN"
}

output "ecs_log_group_name" {
  value       = module.ecs.log_group_name
  description = "CloudWatch log group for ECS tasks"
}

# ─────────────────────────────── ALB Outputs ───────────────────────────────
output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "DNS name of the Application Load Balancer"
}

output "target_group_arn" {
  value       = module.alb.target_group_arn
  description = "Target group ARN for ECS service"
}

# ─────────────────────────────── ACM Outputs ───────────────────────────────
output "certificate_arn" {
  value       = module.acm.certificate_arn
  description = "ACM certificate ARN for tm.<domain>"
}
