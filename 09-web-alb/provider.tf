terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
  backend "s3" {
    bucket = "terraform-vpc-bktt"
    key    = "web-alb-expense-alb"
    region = "us-east-1"
    dynamodb_table = "terraform-vpc-table"
  }
}

provider "aws" {
    region = "us-east-1"
}