resource "aws_security_group" "permitir_ssh" {
  name        = "permitir_ssh_hugo"
  description = "Permitindo SSH para as máquinas criadas pelo terraform"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "Liberando SSH de entrada"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "permitir_ssh"
  }
}
