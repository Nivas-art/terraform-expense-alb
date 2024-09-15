resource "aws_lb" "test" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.alb_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_id.value)

  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
     {
         Name = "${var.project_name}-${var.environment}-alb"
    }
  )
}

##listener##

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Fixed response content</h1>"
      status_code  = "200"
    }
  }
}

##r53 record##

module "records" {
   source  = "terraform-aws-modules/route53/aws//modules/records"
   version = "~> 2.0"

   zone_name = var.zone_name

   records = [
    {
      name    = "*.app-${var.environment}"
      type    = "A"
      allow_overwrite = true
      alias   = {
        name    = aws_lb.test.dns_name
        zone_id = aws_lb.test.zone_id
      }
    }
  ]

  #depends_on = [module.zones]
}