module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.name}-db"

  create_db_option_group    = false
  create_db_parameter_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "14.1"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t4g.large"

  allocated_storage = 20

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name  = "bubbledb"
  username = var.db_username
  password = var.db_password
  port     = 5432

  db_subnet_group_name = module.vpc.database_subnet_group
  vpc_security_group_ids = [
    # aws_security_group.db_vpc_only,
    aws_security_group.db_anywhere
  ]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 2

  tags = local.tags
}
