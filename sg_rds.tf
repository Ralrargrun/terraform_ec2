provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "acesso_mysql" {
  name        = "acesso_mysql"
  description = "Habilita porta padrao mysql"
  vpc_id      = "vpc-06e2ff1a267a79f98"

  ingress = [
    {
      description      = "Porta padrao mysql"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
    }
  ]

  tags = {
    Name = "acesso_mysql"
  }
}
