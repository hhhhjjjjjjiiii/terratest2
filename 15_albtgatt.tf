resource "aws_lb_target_group_attachment" "hjkim_tgatt" {
  target_group_arn = aws_lb_target_group.hjkim_albtg.arn
  target_id        = aws_instance.hjkim_weba.id
  port             = 80
}
