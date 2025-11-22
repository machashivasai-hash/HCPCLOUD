provider "aws"{
region = "eu-north-1"
}

resource "aws_instance" "one" {
  ami                    = "ami-0f50f13aefb6c0a5d "
  instance_type          = "t3.micro"
  key_name               = "AMAZONWEB"
  vpc_security_group_ids = ["sg-0fce156bf5c3972dd"]
  tags = {
    Name = "teja"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd git -y",
      "sudo systemctl start httpd",
      "sudo cd /var/www/html",
      "sudo git clone https://github.com/karishma1521success/swiggy-clone.git",
      "sudo mv swiggy-clone/* .",
      "sudo mv /home/ec2-user/* /var/www/html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C/Users/macha/Downloads/AMAZONWEB.pem")
      host        = self.public_ip
    }
  }
}





