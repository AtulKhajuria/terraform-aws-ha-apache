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
module "compute" {
  source = "./modules/compute"
  environment = var.environment
  project_name = var.project_name
  security_group_id = module.security.ec2_security_group_id
  instance_type = var.instance_type
  common_tags = local.common_tags
}