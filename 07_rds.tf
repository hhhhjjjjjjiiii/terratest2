resource "aws_db_instance" "hjkim_rds" {
  allocated_storage        = var.storage_size
  storage_type             = var.storage_type
  engine                   = var.rds_engine
  engine_version           = "8.0"
  instance_class           = var.rds_ins_type
  name                     = var.rds_name
  identifier               = var.rds_name
  username                 = var.rds_username
  password                 = var.rds_password
  parameter_group_name     = "default.mysql8.0"
  availability_zone        = "${var.region}${var.ava[0]}"
  db_subnet_group_name     = aws_db_subnet_group.hjkim_dbsb.id
  vpc_security_group_ids   = [aws_security_group.hjkim_sg.id]
  skip_final_snapshot      = true
  tags = {
    "Name" = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "hjkim_dbsb" {
  name       = "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.hjkim_pridb[0].id,aws_subnet.hjkim_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsb-gp"
  }
}
