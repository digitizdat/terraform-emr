terraform {
  required_version = ">= 0.12.20"
  backend "s3"    {}
}

provider "aws" {
  version = "= 2.50"
  region  = var.aws_region
}

