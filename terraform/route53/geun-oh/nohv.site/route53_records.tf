resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.id
  name    = "www.nohv.site"
  type    = "CNAME"
  ttl     = 300
  records = [
    "cname.vercel-dns.com.",
  ]
}
