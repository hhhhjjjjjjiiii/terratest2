resource "aws_ami_from_instance" "hjkim_ami" {
  name               = "${var.name}_aws_ami"
  source_instance_id = aws_instance.hjkim_weba.id

  depends_on = [
    aws_instance.hjkim_weba
  ]
}

resource "aws_launch_configuration" "hjkim_aslc" {
  name_prefix          = "${var.name}-web-"
  image_id             = aws_ami_from_instance.hjkim_ami.id
  instance_type        = var.instance_type
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.hjkim_sg.id]
  key_name             = var.key
  user_data            = file("./install.sh")

  # lifecycle {
  #  create_before_destroy = true
  # } 
}

resource "aws_placement_group" "hjkim_place" {
  name     = "${var.name}-place"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hjkim_asg" {
  name                      = "${var.name}-asg"
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.hjkim_aslc.name
  vpc_zone_identifier       = [aws_subnet.hjkim_pub[0].id,aws_subnet.hjkim_pub[1].id]
}

resource "aws_autoscaling_attachment" "hjkim_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.hjkim_asg.id
  alb_target_group_arn   = aws_lb_target_group.hjkim_albtg.arn
}
