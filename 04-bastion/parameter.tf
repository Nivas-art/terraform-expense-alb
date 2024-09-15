resource "aws_ssm_parameter" "bastion_id" {
  name  = "/${var.project_name}/${var.environment}/bastion_id"
  type  = "String"
  value = module.bastion_host.id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/bastion_id"
    }
  )
}