output "db_password" {
    value = module.databse.db_config.password
}

output "lb_dns_name" {
  value = module.autoscaling.lb_dns_name
}