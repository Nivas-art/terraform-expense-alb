resource "aws_ssm_parameter" "alb_id" {
  name  = "/${var.project_name}/${var.environment}/alb_id"
  type  = "String"
  value = aws_lb.test.arn

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/alb_id"
    }
  )
}

resource "aws_ssm_parameter" "listener_arn" {
  name  = "/${var.project_name}/${var.environment}/app_listener_arn"
  type  = "String"
  value = aws_lb_listener.front_end.arn

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/app_listener_arn"
    }
  )
}