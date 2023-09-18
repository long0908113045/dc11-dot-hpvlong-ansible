terraform {
  backend "s3" {
    bucket                  = "dc11-dot-hpvlong-ansible-terraform-state"
    dynamodb_table          = "dc11-dot-hpvlong-ansible-terraform-state-lock"
    key                     = "terraform.tfstate"
    region                  = "ap-southeast-1"
    shared_credentials_file = "~/.aws/credentials"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16.2"
    }
  }
  required_version = ">= 1.5.7"
}