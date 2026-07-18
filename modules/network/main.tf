data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}
resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr
  availability_zone = data.aws_availability_zones.available.names[each.value.az_index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.environment}-${each.key}"
  }
}