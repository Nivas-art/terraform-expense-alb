resource "aws_ssm_parameter" "web_alb_id" {
  name  = "/${var.project_name}/${var.environment}/web_alb_id"
  type  = "String"
  value = aws_lb.web_alb.arn

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/web_alb_id"
    }
  )
}
