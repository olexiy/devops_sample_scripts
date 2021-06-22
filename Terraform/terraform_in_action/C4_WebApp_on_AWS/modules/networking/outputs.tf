output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
        lb = module.lb_sg.sequrity_group.id
        db = module.db_sg.sequrity_group.id
        webserver = module.webserver_sg.sequrity_group.id
  }
}