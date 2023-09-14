terraform {
  backend "s3" {
    bucket = "tfupskill-bucket"
    key = "terraform.tfstate"
    region = "eu-2est-1"
    encrypt = true
    dynamodynamodb_table = "tf-lock-table"    
  }
}