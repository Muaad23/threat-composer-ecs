variable "name" {
  description = "Project name/prefix"
  type        = string
}

variable "container_image" {
  description = "Full image URI in ECR (e.g., 123456789012.dkr.ecr.eu-west-2.amazonaws.com/tm-app:latest)"
  type        = string
}

variable "container_port" {
  description = "Container port exposed"
  type        = number
  default     = 80
}

variable "cpu" {
  description = "Fargate task CPU units"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Fargate task memory (MB)"
  type        = number
  default     = 512
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "log_retention_days" {
  description = "CloudWatch log retention (days)"
  type        = number
  default     = 14
}

# We will use these later when creating the Service (after ALB module)
variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks"
  type        = list(string)
  default     = []
}

variable "service_desired_count" {
  description = "Desired tasks for ECS service (used later)"
  type        = number
  default     = 2
}

variable "target_group_arn" {
  type    = string
  default = ""
}

variable "ecs_security_group_id" {
  type    = string
  default = ""
}

