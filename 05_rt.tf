resource  "aws_route_table" "hjkim_rf" {
  vpc_id = aws_vpc.hjkim_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hjkim_ig.id
  }
  tags = {
    "Name" = "hjkim-rt"
  }
}