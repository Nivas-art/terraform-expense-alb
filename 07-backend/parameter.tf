resource "aws_ssm_parameter" "autoscaling_id" {
  name  = "/${var.project_name}/${var.environment}/autoscaling_arn"
  type  = "String"
  value = aws_autoscaling_group.frontend.arn

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/autoscaling_arn"
    }
  )
}
