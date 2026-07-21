output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "ec2_security_group_id" {
  value = module.security.ec2_security_group_id
}
output "name" {
  value = module.security.alb_security_group_id
}