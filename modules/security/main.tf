resource "aws_security_group" "alb" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}
