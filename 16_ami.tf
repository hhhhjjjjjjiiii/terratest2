resource "aws_ami_from_instance" "hjkim_ami" {
  name               = "hjkim_aws_ami"
  source_instance_id = aws_instance.hjkim_weba.id

  depends_on = [
    aws_instance.hjkim_weba
  ]
}
