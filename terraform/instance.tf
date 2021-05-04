resource "aws_instance" "linux-instance" {
  ami           = "ami-009b16df9fcaac611"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.lesson9-subnet-public-3.id

  vpc_security_group_ids = [aws_security_group.lesson9-all.id]

  key_name = "dvnit"

  tags = {
    "Name" = "linux-instance"
  }

  depends_on = [
    aws_db_instance.lesson9-rds,
  ]
}
