resource "aws_eip" "hjkim_eip_ng" {
  vpc = true  
}

resource "aws_nat_gateway" "hjkim_ng" {
  allocation_id = aws_eip.hjkim_eip_ng.id
  subnet_id     = aws_subnet.hjkim_puba.id
  tags = {
    Name = "hjkim-ng"
  }
  depends_on = [
    aws_internet_gateway.hjkim_ig
  ]
}