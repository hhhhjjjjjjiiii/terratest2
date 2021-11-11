resource "aws_route_table_association" "hjkim_ngass_a" {
  subnet_id      = aws_subnet.hjkim_pria.id
  route_table_id = aws_route_table.hjkim_ngrt.id
}

resource "aws_route_table_association" "hjkim_ngass_c" {
  subnet_id      = aws_subnet.hjkim_pric.id
  route_table_id = aws_route_table.hjkim_ngrt.id
}
