data "aws_ssm_parameter" "alb_id" {
  name = "/${var.project_name}/${var.environment}/alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

