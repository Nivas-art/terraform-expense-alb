resource "aws_lb" "web_alb" {
  name               = "web_alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.public_subnet_id.value)

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    {
    Name = "web_alb"
  }
  )
}

##listener##

resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content web alb</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "web_alb_listener_https" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "443"
  protocol          = "HTTPS"

  certificate_arn   = data.aws_ssm_parameter.aws_acm_certificate.value
  ssl_policy        = "ELBSecurityPolicy-2016-08"

 
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content web alb</h1>"
      status_code  = "200"
    }
  }
}


##r53 records##
module "records" {
   source  = "terraform-aws-modules/route53/aws//modules/records"
   version = "~> 2.0"

   zone_name = var.zone_name

   records = [
    {
      name    = "*.web-${var.environment}"
      type    = "A"
      allow_overwrite = true
      alias   = {
        name    = aws_lb.web_alb.dns_name
        zone_id = aws_lb.web_alb.zone_id
      }
    }
  ]
}

