variable "assume_role_arn" {
  description = "The role to assume when accessing the AWS API."
  default     = ""
}

# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here 
variable "account_id" {
  default = {
    id = "039174979026"
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    # EKS
    eks = {
      id = {
        lguapne2 = {
          region = "ap-northeast-2"
          bucket = "geun-oh-apnortheast2-tfstate"
          key    = "terraform/eks/geunoh_apnortheast2/eks/terraform.tfstate"
        }
      }
    }

    databases = {
      id = {
        lguapne2 = {
          region = "ap-northeast-2"
          bucket = "geun-oh-apnortheast2-tfstate"
          key    = "terraform/databases/geun-oh/geunoh_apnortheast2/terraform.tfstate"
        }
      }
    }

    # VPC
    vpc = {

      geunohdapne2 = {
        region = "ap-northeast-2"
        bucket = "geun-oh-apnortheast2-tfstate"
        key    = "terraform/vpc/geunoh_apnortheast2/terraform.tfstate"
      }

      geunohsapne2 = {
        region = "ap-northeast-2"
        bucket = "geunoh-preprod-apnortheast2-tfstate"
        key    = "geunoh/terraform/vpc/geunohs_apnortheast2/terraform.tfstate"
      }
    }


    # WAF ACL
    waf_web_acl_global = {
      prod = {
        region = ""
        bucket = ""
        key    = ""
      }
    }


    # AWS IAM
    iam = {

      id = {
        region = "ap-northeast-2"
        bucket = "geun-oh-apnortheast2-tfstate"
        key    = "terraform/iam/geun-oh-dev/terraform.tfstate"
      }

      prod = {
        region = "ap-northeast-2"
        bucket = "geun-oh-apnortheast2-tfstate"
        key    = "terraform/iam/geun-oh-prod/terraform.tfstate"
      }
    }


    # AWS KMS
    kms = {

      id = {
        apne2 = {
          region = "ap-northeast-2"
          bucket = "geun-oh-apnortheast2-tfstate"
          key    = "terraform/kms/geun-oh/geunohd_apnortheast2/terraform.tfstate"
        }
      }

      prod = {
        apne2 = {
          region = "ap-northeast-2"
          bucket = "geun-oh-apnortheast2-tfstate"
          key    = "terraform/kms/geun-oh/geunohs_apnortheast2/terraform.tfstate"
        }
      }


    }
  }
}
