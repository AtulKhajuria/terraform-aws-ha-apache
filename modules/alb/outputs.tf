output "alb_arn" {
  description = "ARN of Application Load Balancer"
  value = aws_lb.this.arn
}
output "alb_dns_name" {
  description = "DNS name of ALB"
  value = aws_lb.this.dns_name
}
output "target_group_arn" {
  description = "ARN of Target Group"
  value = aws_lb_target_group.this.arn
}
output "listener_arn" {
  description = "ARN of HTTP Listner"
  value = aws_lb_listener.http.arn
}