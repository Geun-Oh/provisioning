resource "aws_security_group" "external_lb" {
  name        = "${var.service_name}- ${var.vpc_name}-ext"
  description = "${var.service_name} external LB SG"
  vpc_id      = var.target_vpc

  # Only allow access from IPs or SGs you specifiy in ext_lb_ingress_cidrs variables
  # If you don't want to use HTTPS then remove this block
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ext_lb_ingress_cidrs
    description = "External service https port"
  }

  # Allow 80 port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ext_lb_ingress_cidrs
    description = "External service https port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
    description = "External service https port"
  }

  tags = var.sg_variables.external_lb.tags[var.shard_id]
}

#####################External ALB

resource "aws_lb" "external" {
  name     = "${var.service_name}-${var.shard_id}-ext"
  subnets  = var.public_subnets
  internal = false

  # For external LB
  # Home SG(Includes Office IPs) could be adde if this is internal service
  security_groups = [
    aws_security_group.external_lb.id,
  ]

  # For HTTP service, application LB is recommended.
  # You could use other load_balancer_type if you want.
  load_balancer_type = "application"

  tags = var.lb_variables.external_lb.tags[var.shard_id]
}

#####################External ALB
resource "aws_lb_target_group" "external" {
  name                 = "${var.service_name}-${var.shard_id}"
  port                 = var.service_port
  protocol             = "HTTP"
  vpc_id               = var.target_vpc
  slow_start           = var.lb_variables.target_group_slow_start[var.shard_id]
  deregistration_delay = var.lb_variables.target_group_deregistration_delay[var.shard_id]
  # Change the health check setting
  health_check {
    interval            = 15
    port                = var.healthcheck_port
    path                = "/"
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = var.lb_variables.external_lb.tags[var.shard_id]
}

##################### Listener for HTTP Service
resource "aws_lb_listener" "external_80" {
  load_balancer_arn = aws_lb.external.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port     = "443"
      protocol = "HTTPS"
      # 301 -> permanant movement
      status_code = "HTTP_301"
    }
  }
}

#################### Listener for HTTPS Service
resource "aws_lb_listener" "external_443" {
  load_balancer_arn = aws_lb.external.arn
  port              = "443"
  protocol          = "HTTPS"

  certificate_arn = var.acm_external_ssl_certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.external.arn
    type             = "forward"
  }
}

#################### Route53 Record

resource "aws_route53_record" "external_dns" {
	zone_id = var.route53_external_zone_id 
	name = var.domain_name
	type = "A"
	set_identifier = var.aws_region

	latency_routing_policy {
		region = var.aws_region
	}

	alias {
		name = aws_lb.external.dns_name
		zone_id = aws_lb.external.zone_id
		evaluate_target_health = true
	}
}
