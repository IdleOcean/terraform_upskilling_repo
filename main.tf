# Provider aws
provider "aws" {
    region = var.aws-region
    access_key = var.access_key
    secret_key = var.secret_key
}


resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
      Name = "Zak-Main VPC"
    }
}

resource "aws_subnet" "main_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.aws-region
    map_public_ip_on_launch = true

    tags = {
        Name = "Zak-main public subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.aws-region

    tags = {
        Name = "Zak-main private subnet"
    }
}

resource "aws_security_group" "Allow_SSH" {
    name = "Allow-SSH"
    description = "Allow ssh from my machine"
    vpc_id = aws_vpc.main_vpc.id
  
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["213.120.50.228/32"]
    }
}

resource "aws_security_group" "Allow_Http" {
    name = "Allow-http"
    description = "Allow http"
    vpc_id = aws_vpc.main_vpc.id
  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
#reopen terminal as admin

resource "aws_instance" "zak-sparta-training-vm" {
    # ami is the base image used
    ami = var.ami-type # Linux unbuntu 18.04Lts
    instance_type = var.instance-size # size of instance in aws
    tags = {
        name = "zak-upskilling-vm"
    }
}
resource "aws_s3_bucket" "s3_tfupskill-bucket" {
    bucket = "tfupskill-bucket" 
}
#---------------------------------------#
#for any new provider run terraform init
module "github" {
  source = "./modules/githubmod"
}
