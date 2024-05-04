variable "sg_variables" {
  default = {

    ec2 = {
      tags = {

        geunohdapne2 = {
          Name    = "hello-geunohd_apnortheast2-ec2-sg"
          app     = "hello"
          project = "hello"
          env     = "dev"
          stack   = "geunohd_apnortheast2"
        },

        geunohsapne2 = {
          Name    = "hello-geunohs_apnortheast2-ec2-sg"
          app     = "hello"
          project = "hello"
          env     = "dev"
          stack   = "geunohs_apnortheast2"
        },
      }
    }

    external_lb = {
      tags = {

        geunohdapne2 = {
          Name    = "hello-geunohd_apnortheast2-external-lb-sg"
          app     = "hello"
          project = "hello"
          env     = "dev"
          stack   = "geunohd_apnortheast2"
        },

        geunohsapne2 = {
          Name    = "hello-geunohs_apnortheast2-external-lb-sg"
          app     = "hello"
          project = "hello"
          env     = "dev"
          stack   = "geunohs_apnortheast2"
        },

      }
    }
  }
}
