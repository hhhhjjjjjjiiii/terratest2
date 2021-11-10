# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "hjkim_ig" {
  vpc_id = aws_vpc.hjkim_vpc.id

  tags = {
    Name = "hjkim-ig"
  }
}