
terraform {
  required_providers {
    aws = {
        source ="hashicorp/aws"
        version = "~>4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA26XITUEDHSMTFHV5"
    secret_key = "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"
}
