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
  type = string
  description = "EC2 instance type"
}
variable "common_tags" {
    description = "Common tags of project"
    type = map(string)
}