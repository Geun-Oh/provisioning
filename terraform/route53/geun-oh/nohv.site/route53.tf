# AWS Route53 Zone

resource "aws_route53_zone" "main" {
  name    = "nohv.site"
  comment = "nohv.site"
}
