terraform {
  backend "s3" {
    bucket = "tfupskill-bucket"
    key = "terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "tf-lock-table"
  }
}
