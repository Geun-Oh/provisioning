terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "0.6.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

provider "sops" {}
