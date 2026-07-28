variable "environment" {
  type = string
}
variable "project_name" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
variable "common_tags" {
  description = "Common tags of project"
  type        = map(string)
}
variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
}
variable "public_subnet_ids" {
  description = "Public subnet IDs for ASG"
  type        = list(string)
}
variable "instance_profile_name" {
  description = "IAM instance profile for EC2"
  type = string
}