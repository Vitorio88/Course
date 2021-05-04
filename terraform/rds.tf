resource "aws_db_instance" "lesson9-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "lesson9"
  skip_final_snapshot  = true
  publicly_accessible  = true
  username             = "lesson9"
  password             = "Qwerty111"
  parameter_group_name = "default.mysql5.7"

  tags = {
    "Name" = "lesson9-rds"
  }
}
