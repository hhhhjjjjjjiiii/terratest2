resource "aws_lb" "hjkim_alb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = var.load_type
  security_groups    = [aws_security_group.hjkim_sg.id]
  subnets            = [aws_subnet.hjkim_pub[0].id, aws_subnet.hjkim_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "hjkim_albtg" {
  name     = "${var.name}-albtg"
  port     = var.port_http
  protocol = var.protocol_HTTP
  vpc_id   = aws_vpc.hjkim_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = var.protocol_HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

output "alb_dns" {
  value = aws_lb.hjkim_alb.dns_name
}

resource "aws_lb_listener" "hjkim_albli" {
  load_balancer_arn = aws_lb.hjkim_alb.arn
  port              = var.port_http
  protocol          = var.protocol_HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hjkim_albtg.arn
  }
}

resource "aws_lb_target_group_attachment" "hjkim_tgatt" {
  target_group_arn = aws_lb_target_group.hjkim_albtg.arn
  target_id        = aws_instance.hjkim_weba.id
  port             = var.port_http
}
