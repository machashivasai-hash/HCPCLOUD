provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  ami                    = "ami-0f50f13aefb6c0a5d"
  instance_type          = "t3.micro"
  key_name               = "AMAZONWEB"
  vpc_security_group_ids = ["sg-0fce156bf5c3972dd"]

  tags = {
    Name = "teja"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd git",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      
  
  
       "cd /home/ec2-user && git clone https://github.com/karishma1521success/swiggy-clone.git",

      "sudo cp -r /home/ec2-user/swiggy-clone/* /var/www/html/",

      "sudo chmod -R 755 /var/www/html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:/Users/macha/Downloads/AMAZONWEB.pem")
      host        = self.public_ip
    }
  }
}




