variable "project_name"{
    default = "expense"
}

variable "environment"{
    default = "dev"
}

variable "common_tags"{
    default = {
        Terraform = "true"
        Environment = "dev"
    }
}

variable "zone_name"{
    default = "devops-srinu.online"
}