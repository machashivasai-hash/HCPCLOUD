provider "aws" {
  region = "eu-north-1"
}
resource "aws_instance" "name" {
count = 3
  ami = "ami-0f50f13aefb6c0a5d"
  instance_type = "t3.micro"
  tags = {
    Name = "MyFirstInstance"
  }
}
locals {
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install git -y
    sudo amazon-linux-extras enable nginx1
    sudo yum install -y nginx
    cd /home/ec2-user
    git clone https://github.com/Ironhack-Archive/online-clone-amazon.git
    cp -r online-clone-amazon/* /usr/share/nginx/html/
    systemctl enable nginx
    systemctl start nginx
  EOF
}


