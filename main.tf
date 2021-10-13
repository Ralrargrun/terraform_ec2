
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

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"]
  }
}

variable "subnet_id" {
  description = "Digite a Subnet onde deseja criar a máquina: "
  validation {
    condition     = length(var.subnet_id) > 7 && substr(var.subnet_id, 0, 7) == "subnet-"
    error_message = "O valor da subnet_id não é válido, tem que começar com \"subnet-\"."
  }
}

variable "ami" {
  description = "Digite a AMI que iremos utilizar: "
  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "O valor do ami não é válido, tem que começar com \"ami-\"."
  }
}

variable "tamanho" {
  description = "Digite qual é o tamanho da máquina (large, micro...): "
  validation {
    condition     = length(var.tamanho) > 3 && substr(var.tamanho, 0, 3) == "t2."
    error_message = "O valor do tamanho não é válido, tem que começar com \"t2.\"."
  }
}

variable "quantidade" {
  description = "Digite a quantidade de máquinas que deseja: "
}

variable "nome" {
  description = "Digite o nome das máquinas: "
}

output "ssh_conect" {
  value = [
    for key, item in aws_instance.web :
      "ec2 ${key+1} - ${item.private_ip} - ssh -i ~/.ssh/id_rsa ubuntu@${item.public_ip}"
  ]
}

