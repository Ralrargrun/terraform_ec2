provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id # "ami-09e67e426f25ce0d7" #ami ubunto 20
  instance_type = "t3.micro"
  subnet_id     = "subnet-0926d1d3dff8224c3"
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

resource "aws_ebs_volume" "itau_volume_encrypted" {
  size              = 8
  encrypted         = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "Volume itaú"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.itau_volume_encrypted.id
  instance_id = aws_instance.web.id
}