resource "aws_db_instance" "mysql" {
  identifier                  = "${var.env}-${var.db_identifier}"
  engine                      = "mysql"
  engine_version              = var.engine_version
  instance_class              = var.instance_type
  allocated_storage           = var.allocated_storage
  storage_type                = var.storage_type
  db_name                     = "${var.db_name}"
  manage_master_user_password = true
  username                    = var.db_username
  publicly_accessible         = false
  vpc_security_group_ids      = [var.security_group_id]
  db_subnet_group_name        = var.db_subnet_group_name
  skip_final_snapshot         = var.skip_final_snapshot

  tags = {
    Name = "${var.env}-${var.db_identifier}"
  }
}
