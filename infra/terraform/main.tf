terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

<<<<<<< HEAD
  backend "s3" {
    bucket = "your-bucket"
    key    = "terraform/state.tfstate"
    region = "us-east-2"
  }
}
=======
>>>>>>> 1b00fe8 (Fix backend configuration in Terraform)
