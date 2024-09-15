variable "domain_name"{
    default = "devops-srinu.online"
}

variable "common_tags"{
   default = {
     Terraform = "true"
     Project = "expense"
     Environment = "dev"
}
}

variable "project_name"{
    default = "expense"  
}
 variable "environment"{
    default = "dev"
 }
