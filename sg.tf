resource "aws_security_group" "permitir_ssh" {
  name        = "permitir_ssh_hugo"
  description = "Permitindo SSH para as maquinas criadas pelo terraform"
  vpc_id      = "vpc-0d48f0e5799777077"

  ingress = [
    {
      description      = "Liberando SSH de entrada"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null
      description      = "Liberando porta interna pra geral"
    }
  ]

  tags = {
    Name = "permitir_ssh"
  }
}

resource "aws_security_group" "acesso_mysql" {
  name        = "acesso_mysql"
  description = "Habilita porta padrao mysql"
  vpc_id      = "vpc-0d48f0e5799777077"

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

