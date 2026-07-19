project_name = "terraform-aws-ha-apache"
environment  = "dev"
aws_region   = "ap-south-1"
vpc_cidr     = "10.0.0.0/16"
public_subnets = {
  public-a = {
    cidr     = "10.0.1.0/24"
    az_index = 0
  }
  public-b = {
    cidr     = "10.0.2.0/24"
    az_index = 1
  }
}