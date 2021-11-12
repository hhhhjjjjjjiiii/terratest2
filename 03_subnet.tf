# 가용영역 a의 public subnet
resource "aws_subnet" "hjkim_puba" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "hjkim-puba"
  }
}
# 가용영역 a의 private subnet
resource "aws_subnet" "hjkim_pria" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "hjkim-pria"
  }
}
# 가용영역 c의 public subnet
resource "aws_subnet" "hjkim_pubc" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "hjkim-pubc"
  }
}
# 가용영역 c의 private subnet
resource "aws_subnet" "hjkim_pric" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "hjkim-pric"
  }
}
# 가용영역 a의 private DB subnet
resource "aws_subnet" "hjkim_pridba" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "hjkim-pridba"
  }
}
# 가용영역 c의 private DB subnet
resource "aws_subnet" "hjkim_pridbc" {
  vpc_id     = aws_vpc.hjkim_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "hjkim-pridbc"
  }
}