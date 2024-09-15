resource "aws_acm_certificate" "expense" {
  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_route53_record" "backend" {
  for_each = {
    for dvo in aws_acm_certificate.expense.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = dvo.domain_name == "expense.org" ? data.aws_route53_zone.expense_org.zone_id : data.aws_route53_zone.expense_com.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "validate" {
  certificate_arn         = aws_acm_certificate.expense.arn
  validation_record_fqdns = [for record in aws_route53_record.example : record.fqdn]
}