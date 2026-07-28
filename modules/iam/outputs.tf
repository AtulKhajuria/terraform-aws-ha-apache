output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
  description = "EC2 instance profile name"
}
output "instance_profile_arn" {
  description = "EC2 instance profile arn"
  value = aws_iam_instance_profile.ec2_profile.arn
}
output "role_name" {
  description = "EC2 instance role name"
  value = aws_iam_role.ec2_role.name
}
output "role_arn" {
  description = "EC2 instance role arn"
  value = aws_iam_role.ec2_role.arn
}