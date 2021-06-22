output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
        lb = module.lb_sg.sequrity_group_id
        db = module.db_sg.sequrity_group_id
        webserver = module.webserver_sg.sequrity_group_id
  }
}