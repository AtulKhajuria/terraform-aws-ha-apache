terraform {
  backend "s3" {
    bucket = "atul-terraform-state-2026"
    key = "terraform-projects/terraform-aws-ha-apache"
    region = "ap-south-1"
    use_lockfile = true
  }
}