data "aws_ssm_parameter" "sec_id" {
  name = "/${var.project_name}/${var.environment}/db_sg_id"
}

data "aws_ssm_parameter" "bd_subnet_group_name" {
  name = "/${var.project_name}/${var.environment}/db_subnet_group_name"
}