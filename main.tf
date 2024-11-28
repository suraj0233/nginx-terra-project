terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }

  backend "s3" {
    bucket = "nginx-statefile01"
    key = "backend.tfstate"
    region = "ap-south-1"    
  }
}