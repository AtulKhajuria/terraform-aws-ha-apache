resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "${var.project_name}-${var.environment}-high-cpu-alarm"
  alarm_description = "Scale out when average CPU >= 70%"
  actions_enabled   = true
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold = 70
  evaluation_periods = 2
  period = 300
  namespace = "AWS/EC2"
  statistic = "Average"
  metric_name = "CPUUtilization"
  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name = "${var.project_name}-${var.environment}-low-cpu-alarm"
  alarm_description = "Scale out when average CPU <= 30%"
  actions_enabled   = true
  comparison_operator = "LessThanOrEqualToThreshold"
  threshold = 30
  evaluation_periods = 2
  period = 300
  namespace = "AWS/EC2"
  statistic = "Average"
  metric_name = "CPUUtilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  alarm_actions = [ 
    aws_autoscaling_policy.scale_in.arn 
    ]
  treat_missing_data = "notBreaching"
}