variable "name" {
  description = "Name/prefix for all network resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "aws_region" {
  description = "AWS region (used to get AZs)"
  type        = string
}
