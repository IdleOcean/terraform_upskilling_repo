#Provider aws
# provider "aws" {
#     region = "eu-west-1"
#     access_key = var.access_key
#     secret_key = var.secret_key
# }


# #create 2 enviroment var to store keys
# variable "access_key" {
#     type = string
# }

# variable "secret_key" {
#     type = string
# }

# resource "aws_vpc" "main_vpc" {
#     cidr_block = "10.0.0.0/16"
#     instance_tenancy = "default"
#     tags = {
#       Name = "Zak-Main VPC"
#     }
# }

# resource "aws_subnet" "main_subnet" {
#     vpc_id = aws_vpc.main_vpc
#     cidr_block = "10.0.1.0/24"
#     availability_zone = "eu-west-1"
#     map_public_ip_on_launch = true

#     tagss = {
#         Name = "Zak-main public subnet"
#     }
# }

# resource "aws_subnet" "private_subnet" {
#     vpc_id = aws_vpc.main_vpc
#     cidr_block = "10.0.2.0/24"
#     availability_zone = "eu-west-1"

#     tags = {
#         Name = "Zak-main private subnet"
#     }
# }

# resource "aws_security_group" "Allow_SSH" {
#     name = "Allow-SSH"
#     description = "Allow ssh from my machine"
#     vpc_id = aws_vpc.main_vpc.id
  
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["213.120.50.228/32"]
#     }
# }

# resource "aws_security_group" "Allow_Http" {
#     name = "Allow-http"
#     description = "Allow http"
#     vpc_id = aws_vpc.main_vpc.id
  
#     ingress {
#         from_port = 80
#         to_port = 80
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }
# #reopen terminal as admin

# resource "aws_instance" "zak-sparta-training-vm" {
#     # ami is the base image used
#     ami = "ami-0eb260c4d5475b901" # Linux unbuntu 18.04Lts
#     instance_type = "t2.micro" # size of instance in aws
#     tags = {
#         name = "zak-hmrc-vm"
#     }
# }

#---------------------------------------#
#for any new provider run terraform init

provider "github" {
    token = var.github-token
}

resource "github_repository" "Terraform-upskilling" {
    name = "terraform_upskilling_repo" 
    description = "Test"
    visibility = "public"
}
