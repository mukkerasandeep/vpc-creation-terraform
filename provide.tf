terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
  profile    = "default"
  access_key = "AKIATZ6OJOW5FLTLKL6M"
  secret_key = "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"
}
