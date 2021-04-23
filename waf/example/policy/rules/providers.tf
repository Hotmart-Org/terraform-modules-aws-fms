terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

# N. Virginia
provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
}