terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.36.0"
    }
  }
}

# N. Virginia
provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  profile = var.profile
}

# Ohio
provider "aws" {
  alias   = "us-east-2"
  region  = "us-east-2"
  profile = var.profile
}

# California
provider "aws" {
  alias   = "us-west-1"
  region  = "us-west-1"
  profile = var.profile
}

# Oregon
provider "aws" {
  alias   = "us-west-2"
  region  = "us-west-2"
  profile = var.profile
}

# Sao Paulo
provider "aws" {
  alias   = "sa-east-1"
  region  = "sa-east-1"
  profile = var.profile
}

# provider "aws" {
#   alias   = "af-south-1"
#   region  = "af-south-1"
#   profile = var.profile
# }

# provider "aws" {
#   alias   = "ap-east-1"
#   region  = "ap-east-1"
#   profile = var.profile
# }

provider "aws" {
  alias   = "ap-south-1"
  region  = "ap-south-1"
  profile = var.profile
}

provider "aws" {
  alias   = "ap-northeast-3"
  region  = "ap-northeast-3"
  profile = var.profile
}

provider "aws" {
  alias   = "ap-northeast-2"
  region  = "ap-northeast-2"
  profile = var.profile
}

provider "aws" {
  alias   = "ap-southeast-1"
  region  = "ap-southeast-1"
  profile = var.profile
}

provider "aws" {
  alias   = "ap-southeast-2"
  region  = "ap-southeast-2"
  profile = var.profile
}

provider "aws" {
  alias   = "ap-northeast-1"
  region  = "ap-northeast-1"
  profile = var.profile
}

provider "aws" {
  alias   = "ca-central-1"
  region  = "ca-central-1"
  profile = var.profile
}

provider "aws" {
  alias   = "eu-central-1"
  region  = "eu-central-1"
  profile = var.profile
}

provider "aws" {
  alias   = "eu-west-1"
  region  = "eu-west-1"
  profile = var.profile
}

provider "aws" {
  alias   = "eu-west-2"
  region  = "eu-west-2"
  profile = var.profile
}

# provider "aws" {
#   alias   = "eu-south-1"
#   region  = "eu-south-1"
#   profile = var.profile
# }

provider "aws" {
  alias   = "eu-west-3"
  region  = "eu-west-3"
  profile = var.profile
}

provider "aws" {
  alias   = "eu-north-1"
  region  = "eu-north-1"
  profile = var.profile
}

# provider "aws" {
#   alias   = "me-south-1"
#   region  = "me-south-1"
#   profile = var.profile
# }