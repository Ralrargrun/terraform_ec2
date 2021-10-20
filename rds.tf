resource "aws_rds_cluster" "hugoern" {
  cluster_identifier   = "hugoern"
  db_subnet_group_name = aws_db_subnet_group.hugoern.name
  engine_mode          = "multimaster"
  master_password      = "root1234"
  master_username      = "root"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "hugoern" {
  name       = "main"
  subnet_ids = ["subnet-0926d1d3dff8224c3", "subnet-060e21b9706e83381"]
  tags = {
    Name = "Subnet aurora group"
  }
}
