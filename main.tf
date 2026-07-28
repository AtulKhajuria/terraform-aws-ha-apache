module "network" {
  source         = "./modules/network"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  environment    = var.environment
  project_name   = var.project_name
  common_tags    = local.common_tags
}
module "security" {
  source       = "./modules/security"
  vpc_id       = module.network.vpc_id
  project_name = var.project_name
  environment  = var.environment
}
module "compute" {
  source                = "./modules/compute"
  environment           = var.environment
  project_name          = var.project_name
  security_group_id     = module.security.ec2_security_group_id
  instance_type         = var.instance_type
  common_tags           = local.common_tags
  public_subnet_ids     = module.network.public_subnet_ids
  target_group_arn      = module.alb.target_group_arn
  instance_profile_name = module.iam.instance_profile_name
}
module "alb" {
  source                = "./modules/alb"
  vpc_id                = module.network.vpc_id
  public_subnet_ids     = module.network.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  project_name          = var.project_name
  environment           = var.environment
  common_tags           = local.common_tags
}
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
}