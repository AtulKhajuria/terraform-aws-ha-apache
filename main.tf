module "network" {
  source         = "./modules/network"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  environment    = var.environment
  project_name   = var.project_name
  common_tags    = local.common_tags
}
module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
  project_name = var.project_name
  environment = var.environment
}
