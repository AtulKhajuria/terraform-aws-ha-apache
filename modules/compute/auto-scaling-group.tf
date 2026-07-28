resource "aws_autoscaling_group" "this" {
  name                = "${var.project_name}-${var.environment}-asg"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  vpc_zone_identifier = var.public_subnet_ids
  target_group_arns = [
    var.target_group_arn
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }
  wait_for_capacity_timeout = "10m"
  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
    }
  }
  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-apache"
    propagate_at_launch = true
  }
}