provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/user/.aws/lab"
}

terraform {
 backend "s3" {
  encrypt = true
  bucket = "running-state"
  region = "us-east-1"
  key = "terraform.tfstate"
  shared_credentials_file = "/home/user/.aws/lab"
 }
}


