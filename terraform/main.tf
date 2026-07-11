module "vpc" {
  source = "../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b

  public_subnet_a_cidr  = var.public_subnet_a_cidr
  public_subnet_b_cidr  = var.public_subnet_b_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_b_cidr = var.private_subnet_b_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true
}

