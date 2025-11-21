provider "aws" {
  region = "eu-north-1"
}
resource "aws_instance" "name" {
  ami = "ami-0f50f13aefb6c0a5d"
  instance_type = "t3.micro"
  tags = {
    Name = "MyFirstInstance"
  }
}
