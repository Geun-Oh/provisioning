terraform {
  required_version = ">=1.0.0"

  backend "s3" {
    bucket         = "geun-oh-apnortheast2-tfstate"
    key            = "terraform/route53/geun-oh/nohv.site/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
