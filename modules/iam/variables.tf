variable "project_name" {
  type = string
  description = "Project Name"
}
variable "environment" {
  type = string
  description = "Project Environment"
}
variable "common_tags" {
  type = map(string)
  description = "Commons tags of project"
}