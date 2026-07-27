variable "environment" {
  type = string
}
variable "project_name" {
  type = string
}
variable "common_tags" {
    description = "Common tags of project"
    type = map(string)
}
variable "vpc_id" {
  type = string
}
variable "alb_security_group_id" {
  description = "Security Group for ALB"
  type = string
}
variable "public_subnet_ids" {
  description = "Public subnet IDs where the Application Load Balancer will be deployed"
  type = list(string)
}