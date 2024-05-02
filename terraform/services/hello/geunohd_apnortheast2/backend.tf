terraform {
	required_version = ">=1.0.0"

	backend "s3" {
		bucket = "geunoh-apnortheast2-tfstate"
		key = "terraform/services/hello/geunohd_apnortheast2/terraform.tfstate"
		region = "ap-northeast-2"
		encrypt = true
		dynamodb_table = "terraform-lock"
	}
}
