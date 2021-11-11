resource "aws_route_table_association" "hjkim_rtass_a" {
  subnet_id = aws_subnet.hjkim_puba.id
  route_table_id = aws_route_table.hjkim_rf.id 
}

resource "aws_route_table_association" "hjkim_rtass_c" {
  subnet_id = aws_subnet.hjkim_pubc.id
  route_table_id = aws_route_table.hjkim_rf.id 
}