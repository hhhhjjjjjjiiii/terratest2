resource "aws_autoscaling_group" "hjkim_asg" {
  name                      = "hjkim-asg"
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.hjkim_aslc.name
  vpc_zone_identifier       = [aws_subnet.hjkim_puba.id, aws_subnet.hjkim_pubc.id]
}