variable "service_name" {
	description = ""
}

variable "short_id" {
	description = "Text used to identify shard of infrastructure components. For new shards, this should be only the shard id and should not include the AWS region (e.g. ap01)"
}

variable "private_subnets" {
	description = "A comma delimited list of private subnets for the VPC"
	type = list(string)
}

variable "public_subnets" {
	description = "A comma-delimited list of public subnets for the VPC"
	type = list(string)
	default = []
}

variable "aws_region" {
	description = "The AWS region to deploy the shard storage layer into"
}

variable "billing tag" {
	description = "The shard's default billing tag"
}

variable "target_vpc" {
	description = "The AWS ID of the VPC this shard is being deployed into"
}

variable "availability_zone" {
	description = ""
	default = "ap-northeast-2a"
}

variable "route53_internal_domain" {
	description = "base domain name for internal"
}

variable "route53_internal_zone_id" {
	description = "internal domain zone id"
}

variable "vpc_cidr_numeral" {
	description = "The VPC CIDR numeral (e.g. 'n' in 10.n.0.0/16)"
}

variable "acm_external_ssl_certificate_arn" {
	description = "ssl cert id"
	default = ""
}

variable "ext_lb_ingress_cidrs" {
	description = "Ingress of security group of external load-balancer"
	type = list(string)
}

variable "home_sg" {
  description = "Office people IP list."
  default     = ""
}

variable "domain_name" {
  description = "Domain Name"
}

variable "service_port" {
  description = "Service Port"
}

variable "healthcheck_port" {
  description = "Healthcheck Port"
}
