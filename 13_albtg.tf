resource "aws_lb_target_group" "hjkim_albtg" {
  name     = "hjkim-albtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hjkim_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/index.html"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  }
}

output "alb_dns" {
  value = aws_lb.hjkim_alb.dns_name
}
