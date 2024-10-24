resource "aws_db_instance" "shubham_rds" {
  identifier = "shubham-rds-instance"
  allocated_storage    = var.allocated_storage
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = true
}