module "mysql_rds" {
  source = "../../../modules/databases/mysql_rds"

  env                  = "dev"
  db_identifier        = "mysql-database"
  engine_version       = "8.4.3"
  instance_type        = "db.t4g.micro"
  allocated_storage    = 20
  storage_type         = "gp3"
  db_name              = "testdb"
  db_username          = "mysqladmin"
  security_group_id    = data.terraform_remote_state.mysql_security_group_id.outputs.mysql_security_group_id
  db_subnet_group_name = data.terraform_remote_state.mysql_subnet_group_id.outputs.mysql_subnet_group_name
  skip_final_snapshot  = true
}