
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1 # replicas da instancia princial
  identifier         = "docdb-cluster-replica-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.r5.large"
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "my-docdb-cluster" # instancia princial
  engine                  = "docdb"
  #vpc_id                  = "vpc-0d48f0e5799777077"
  master_username         = "danilo"
  master_password         = "danilo_doc134_db"
  vpc_security_group_ids  = ["${aws_security_group.acesso_docdb.id}"] # caso precise 
  backup_retention_period = 1 # periodo do backup
  preferred_backup_window = "07:00-09:00" # hora que vai realizar o backup
  deletion_protection     = false # não protegido para exclusão
  skip_final_snapshot     = true # não criar snapshot - caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
  tags = {
    Name = "meu docdb"
  }
}

# terraform refresh - mostra retorno do output
output "ids" {
  value = aws_docdb_cluster.docdb.id
}
