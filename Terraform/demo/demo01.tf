provider "aws" {
  access_key = "xxx"
  secret_key = "yyy"
  region     = "eu-central-1"
}

resource "aws_instance" "myDemoInstance" {
  ami           = "ami-02f9ea74050d6f812"
  instance_type = "t3.micro"
}

resource "aws_s3_bucket" "myfirstbucket"{
    bucket = "my-first-s3-terraform-bucket77"
    acl = "private"

    tags = {
        Name = "My Bucket"
        Environment = "Dev"
    }
}

resource "aws_vpc" "dev" {
    cidr_block      = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
      "Name" = "dev-vpc"
    }
}

resource "aws_subnet" "sub" {
    vpc_id  = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"

    tags = {
      "Name" = "dev-subnet"
    }
}

resource "aws_db_instance" "projectdb" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.19"
  instance_class       = "db.t3.micro"
  name                 = "myterraformdb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
