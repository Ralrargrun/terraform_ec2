
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = var.subnet_id
  ami           = var.ami
  instance_type = var.tamanho
  count         = var.quantidade
  key_name      = "key-dev-hugo-amazon"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    #kms_key_id  = "arn:aws:kms:us-east-1:534566538491:key/90847cc8-47e8-4a75-8a69-2dae39f0cc0d"
    volume_size = 20
  }
  tags = {
    Name = "${var.nome}-${count.index}"
  }
}
