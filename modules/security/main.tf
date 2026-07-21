resource "aws_security_group" "alb" {
  vpc_id = var.vpc_id
  name = "${var.project_name}-${var.environment}-alb-sg"
  description = "Security group for Application Load Balancer"
  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "alb_all" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}
resource "aws_security_group" "ec2" {
  vpc_id = var.vpc_id
  name = "${var.project_name}-${var.environment}-ec2-sg"
  description = "Security group for EC2"
  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ec2_http" {
  security_group_id = aws_security_group.ec2.id
  referenced_security_group_id = aws_security_group.alb.id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "ec2_all" {
  security_group_id = aws_security_group.ec2.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}