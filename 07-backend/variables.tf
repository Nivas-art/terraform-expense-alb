variable "common_tags"{
   default = {
     Terraform = "true"
     Project = "expense"
     Environment = "dev"
     component = "backend"
}
}

variable "project_name"{
    default = "expense"  
}
 variable "environment"{
    default = "dev"
 }


variable "zone_name"{
   default = "devops-srinu.online"
}