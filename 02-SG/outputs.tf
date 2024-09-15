output "db_id"{
    value = module.db.sg_id
}

output "backend_id"{
    value = module.backend.sg_id
}

output "frontend_id"{
    value = module.frontend.sg_id
}

output "bastion_id"{
    value = module.bastion.sg_id
}

output "alb_id"{
    value = module.alb.sg_id
}

output "vpn_id"{
    value = module.vpn.sg_id
}
