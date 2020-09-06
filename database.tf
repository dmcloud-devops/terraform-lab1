resource "aws_db_instance" "banco" {
  identifier           = "meubanco"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "12345678"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.lab1_internal_mysql.id}"]
}