
#create 2 enviroment var to store keys
variable "access_key" {
    type = string
}
variable "secret_key" {
    type = string
}
variable  "aws-region"{
    default = "eu-west-1"
}
variable "ami-type" {
    default = "ami-0eb260c4d5475b901" 
}
variable "instance-size" {
    default = "t3.micro"
  
}