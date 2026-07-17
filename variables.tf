variable "aws_region" {
  description = "AWS region where infrastructure will be deployed."
  default     = "ap-south-1"
  type        = string
}
variable "environment" {
  type = string
}
variable "project_name" {
  type = string
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "public_subnet_cidrs" {
  description = "CIDR block for public subnets"
  type        = list(string)
}