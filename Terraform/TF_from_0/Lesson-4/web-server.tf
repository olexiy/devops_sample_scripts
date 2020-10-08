provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-0474863011a7d1541" # Amazone instance AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  # user_data              = file("user_data.sh")
  user_data              = templatefile("user_data.sh.tpl", {
    f_name = "Olexiy"
    l_name ="Sokurenko"
    names =["Vasya", "Kolya", "Petja"]
  })

  tags = {
    Name  = "Web Server Security Group"
    Owner = "Olexiy Sokurenko"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My Fierst security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server Build by Terraform"
    Owner = "Olexiy oskurenko"
  }
}
