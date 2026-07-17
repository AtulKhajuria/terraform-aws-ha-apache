project_name = "terraform-aws-ha-apache"
environment = "dev"
aws_region = "ap-south-1"
vpc_cidr = "10.0.0.0/16"
public_subnets_cidrs = [ 
    "10.0.1.0/24",
    "10.0.2.0/24" 
    ]