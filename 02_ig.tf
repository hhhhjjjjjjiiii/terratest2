resource "aws_internet_gateway" "hjkim_ig" {
  vpc_id = aws_vpc.hjkim_vpc.id

  tags = {
    Name = "${var.name}-ig"
  }
}

resource  "aws_route_table" "hjkim_rf" {
  vpc_id = aws_vpc.hjkim_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.hjkim_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "hjkim_rtass_a" {
  count = length(var.cidr_public)
  subnet_id = aws_subnet.hjkim_pub[count.index].id
  route_table_id = aws_route_table.hjkim_rf.id 
}
