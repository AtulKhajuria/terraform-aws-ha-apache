locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    Owner       = "Atul"
    ManagedBy   = "Terraform"
  }
}