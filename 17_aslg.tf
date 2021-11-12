resource "aws_launch_configuration" "hjkim_aslc" {
  name_prefix = "hjkim-web-"
  image_id = aws_ami_from_instance.hjkim_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.hjkim_sg.id]
  key_name = "hjkim-key"
  # user_data = file("./install.sh")

  lifecycle {
    create_before_destroy = true
  }
}