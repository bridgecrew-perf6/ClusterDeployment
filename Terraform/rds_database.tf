resource "aws_db_instance" "database" {
  allocated_storage     = 10
  max_allocated_storage = 20
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t3.micro"
  name                  = "bubble_db"
  username              = "foo"
  password              = "foobarbaz"
  parameter_group_name  = "default.mysql5.7"
  skip_final_snapshot   = true
}