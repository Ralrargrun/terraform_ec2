resource "aws_rds_cluster" "default" {
 # cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
 # availability_zones      = ["us-east-1a", "us-east-1b"]
  db_subnet_group_name = aws_db_subnet_group.database.name
  database_name           = "hugo_db"
  master_username       = "hugouser"
  master_password       = "hugopass"
  vpc_security_group_ids = ["${aws_security_group.acesso_mysql.id}"]
  backup_retention_period = 0 # não criar backup periódico
  # preferred_backup_window = "07:00-09:00" # hora que vai realizar o backup
  deletion_protection = false # não protegido para exclusão
  skip_final_snapshot = true # não criar snapshot - caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
  # final_snapshot_identifier = true # caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
  tags = {
    Name = "meu mysql"
  }
}

data "aws_db_subnet_group" "database" {
  name = "grupo-subnet-db-hugo"
  subnet_ids = ["subnet-063aaae37c891d10a"]
}
