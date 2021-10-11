provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id # "ami-09e67e426f25ce0d7" #ami ubunto 20
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["vpc-0d48f0e5799777077"] #vpc Hugo

  tags = {
    Name = "MinhaPrimeiraMaquinaHugo"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"]
  }
}