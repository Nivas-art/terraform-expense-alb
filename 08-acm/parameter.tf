resource "aws_ssm_parameter" "aws_acm_certificate" {
  name  = "/${var.project_name}/${var.environment}/aws_acm_certificate"
  type  = "String"
  value = aws_acm_certificate.expense.arn

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/aws_acm_certificate"
    }
  )
}