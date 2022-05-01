output "nginx-tgt" {
  value = aws_lb_target_group.nginx-tgt.arn
}

output "wordpress-tgt" {
  value = aws_lb_target_group.wordpress-tgt.arn
}

output "tooling-tgt" {
  value = aws_lb_target_group.tooling-tgt.arn
}

output "alb_dns_name" {
  value = aws_lb.ext-alb.dns_name
}
