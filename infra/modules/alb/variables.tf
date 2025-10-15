variable "name" {
  description = "Prefix name for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will live"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "container_port" {
  description = "Port exposed by ECS container"
  type        = number
  default     = 80
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "ACM cert ARN for HTTPS"
}

