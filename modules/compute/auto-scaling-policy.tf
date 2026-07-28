resource "aws_autoscaling_policy" "scale_out" {
  adjustment_type = "ChangeInCapacity"
  name = "scale-out-policy"
  scaling_adjustment = 1
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}
resource "aws_autoscaling_policy" "scale_in" {
  adjustment_type = "ChangeInCapacity"
  name = "scale-in-policy"
  scaling_adjustment = -1
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}