resource "aws_lb" "hjkim_alb" {
  name               = "hjkim-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hjkim_sg.id]
  subnets            = [aws_subnet.hjkim_puba.id, aws_subnet.hjkim_pubc.id]

  tags = {
    "Name" = "hjkim-alb"
  }
}
