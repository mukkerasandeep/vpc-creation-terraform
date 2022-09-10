resource "aws_instance" "public-nginx" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.micro"
  key_name                    = "msykey"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public-sg.id]

  tags = {
    Name = "public-nginx"
  }
  user_data = <<EFO
#!/bin/bash
sudo apt-get update
sudo apt install nginx -y
sudo echo "hi welcome to terraform vpc-creation" >/var/www/html/index.html
EFO

}

resource "aws_instance" "private-nginx" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.micro"
  key_name                    = "msykey"
  associate_public_ip_address = "false"
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.public-sg.id]


  tags = {
    Name = "private-nginx"
  }
  user_data = <<EFO
#!/bin/bash
sudo apt-get update  
sudo apt install nginx -y
sudo echo "hi welcome to terraform vpc-creation" >/var/www/html/index.html
EFO

}

