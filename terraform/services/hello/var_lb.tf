variable "lb_variables" {
  default = {

    target_group_slow_start = {
      geunohdapne2 = 0
      geunohsapne2 = 0
    }

    target_group_deregistration_delay = {
      geunohdapne2 = 0
      geunohsapne2 = 0
    }

    external_lb = {
      tags = {

        geunohdapne2 = {
          Name    = "hello-geunohd_apnortheast2-external-lb"
          app     = "hello"
          project = "hello"
          env     = "dev"
          stack   = "geunohd_apnortheast2"
        },

        geunohsapne2 = {
          Name    = "hello-geunohs_apnortheast2-external-lb"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "geunohs_apnortheast2"
        },
      }
    }
  }
}
