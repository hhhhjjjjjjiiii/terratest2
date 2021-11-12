resource "aws_autoscaling_attachment" "hjkim_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.hjkim_asg.id
  alb_target_group_arn = aws_lb_target_group.hjkim_albtg.arn
  }