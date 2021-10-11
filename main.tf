provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  subnet_id              = "subnet-0926d1d3dff8224c3"
  # availability_zones = ["us-east-1"] # configurando zona para criar maquinas
  tags = {
    Name = "MinhaPrimeiraMaquinaHugo"
  }
}


resource "aws_ebs_volume" "itau_volume_encrypted" {
  size      = 8
  encrypted = true
  availability_zone = "us-east-1a"
  tags      = {
    Name = "Volume itaú"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.itau_volume_encrypted.id
  instance_id = aws_instance.web.id
}
