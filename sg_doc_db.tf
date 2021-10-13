resource "aws_security_group" "acesso_docdb" {
  name        = "acesso_docdb"
  description = "Habilita acesso docdb"
  vpc_id      = "vpc-0d48f0e5799777077"
  ingress = [
    {
      from_port        = 27017
      to_port          = 27017
      description      = "Acesso DocDB"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    }
  ]

  tags = {
    Name = "acesso_docdb"
  }
}
