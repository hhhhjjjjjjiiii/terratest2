resource "aws_route_table" "hjkim_ngrt" {
  vpc_id = aws_vpc.hjkim_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.hjkim_ng.id
  }
  
  tags = {
    "Name" = "hjkim-ngrt"
  }
}