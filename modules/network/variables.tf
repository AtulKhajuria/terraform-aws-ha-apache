variable "vpc_cidr" {
  type = string
}
variable "public_subnets" {
  description = "Public subnet configuration."
  type = map(object({
    cidr = string
    az_index = number 
  }))
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}
variable "common_tags" {}