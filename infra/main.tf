# ─────────────────────────────── Network ───────────────────────────────
# Creates VPC, subnets, route tables, IGW, NAT
module "network" {
  source     = "./modules/network"
  name       = var.project_name
  vpc_cidr   = var.vpc_cidr
  aws_region = var.aws_region
}

# ─────────────────────────────── ACM ───────────────────────────────
# Requests SSL certificate for tm.<domain> via DNS validation
module "acm" {
  source         = "./modules/acm"
  domain_name    = var.domain_name
  subdomain      = "tm"
  hosted_zone_id = var.hosted_zone_id
}

# ─────────────────────────────── ALB ───────────────────────────────
# Creates ALB, SGs, listeners, and target group
module "alb" {
  source            = "./modules/alb"
  name              = var.project_name
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  container_port    = 80
  certificate_arn   = module.acm.certificate_arn
}

# ─────────────────────────────── ECS ───────────────────────────────
# Creates ECS cluster, task definition, service
module "ecs" {
  source          = "./modules/ecs"
  name            = var.project_name
  aws_region      = var.aws_region
  container_image = "491065739552.dkr.ecr.eu-west-2.amazonaws.com/tm-app:latest"
  container_port  = 80
  cpu             = 256
  memory          = 512

  private_subnet_ids    = module.network.private_subnet_ids
  target_group_arn      = module.alb.target_group_arn
  ecs_security_group_id = module.alb.ecs_sg_id
  service_desired_count = 2
}

# ─────────────────────────────── DNS ───────────────────────────────
# Creates A record: tm.<domain> → ALB
module "dns" {
  source         = "./modules/route53"
  hosted_zone_id = var.hosted_zone_id
  record_name    = "tm.${var.domain_name}"
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id
}
