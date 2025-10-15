variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Prefix used for naming AWS resources"
  type        = string
  default     = "threat-composer"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "domain_name" {
  description = "Root domain name for the application (e.g., muaad.org)"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID for the root domain"
  type        = string
}
