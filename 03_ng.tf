resource "aws_eip" "hjkim_eip_ng" {
  vpc = true  
}

resource "aws_nat_gateway" "hjkim_ng" {
  allocation_id = aws_eip.hjkim_eip_ng.id
  subnet_id     = aws_subnet.hjkim_pub[0].id
  tags = {
    Name = "${var.name}-ng"
  }
  depends_on = [
    aws_internet_gateway.hjkim_ig
  ]
}

resource "aws_route_table" "hjkim_ngrt" {
  vpc_id = aws_vpc.hjkim_vpc.id
  
  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.hjkim_ng.id
  }
  
  tags = {
    "Name" = "${var.name}-ngrt"
  }
}

resource "aws_route_table_association" "hjkim_ngass" {
  count             = length(var.cidr_private)
  subnet_id      = aws_subnet.hjkim_pri[count.index].id
  route_table_id = aws_route_table.hjkim_ngrt.id
}