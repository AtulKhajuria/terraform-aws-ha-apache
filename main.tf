module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  environment         = var.environment
  project_name        = var.project_name
  common_tags         = local.common_tags
}