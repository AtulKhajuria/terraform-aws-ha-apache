resource "aws_lb_target_group" "this" {
  name = "${var.project_name}-${var.environment}-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"
  health_check {
    path = "/"
    matcher = "200"
    protocol = "HTTP"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-tg"
    }
  )
}