provider "aws" {
  access_key = "xxx"
  secret_key = "yyyy"
  region     = "eu-central-1"
}

resource "aws_instance" "myUbuntu" {
  count         = 3
  ami           = "ami-id"
  instance_type = "t3.micro"
}
