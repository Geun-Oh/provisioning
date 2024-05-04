module "test-key" {
  source = "../_modules/aws_ssm_parameter"

  ssm_parameter_name        = "test-key"
  ssm_parameter_key_id      = "alias/deployment-common"
  ssm_parameter_description = "for testing"
  ssm_parameter_value       = var.secret-value
}

/*
module "star_nohv_site_acm_arn_apnortheast2" {
  source                    = "../_modules/aws_ssm_parameter"

  ssm_parameter_name        = "star_nohv_site_acm_arn_apnortheast2"
  ssm_parameter_key_id      = "alias/star_nohv_site_acm_arn_apnortheast2"
  ssm_parameter_description = "for star_nohv_site_acm_arn_apnortheast2"
  ssm_parameter_value       = var.star_nohv_site_acm_arn_apnortheast2
}

module "nohv_site_zone_id" {
  source                    = "../_modules/aws_ssm_parameter"

  ssm_parameter_name        = "nohv_site_zone_id"
  ssm_parameter_key_id      = "alias/nohv_site_zone_id"
  ssm_parameter_description = "for nohv_site_zone_id"
  ssm_parameter_value       = var.nohv_site_zone_id
}

module "account_id" {
  source                    = "../_modules/aws_ssm_parameter"

  ssm_parameter_name        = "account_id"
  ssm_parameter_key_id      = "alias/account_id"
  ssm_parameter_description = "for account_id"
  ssm_parameter_value       = var.account_id
}
*/
