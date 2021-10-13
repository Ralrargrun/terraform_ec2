
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = "subnet-063aaae37c891d10a"
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  root_block_device {
    encrypted   = true
    kms_key_id  = "arn:aws:kms:us-east-1:534566538491:key/90847cc8-47e8-4a75-8a69-2dae39f0cc0d"
    volume_size = 20
  }
  tags = {
    Name = "ec2-hugo-tf"
  }
}
