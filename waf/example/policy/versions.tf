terraform {
  required_version = ">= 0.12"
  # backend "s3" {
  #   bucket  = ""
  #   region  = ""
  #   profile = ""
  #   key     = ""
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.36.0"
    }
  }
}