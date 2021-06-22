output "db_config" {
  value = {
      user      = aws_db_instance.database.username
      password  = aws_db_instance.database.password
      hostname  = aws_db_instance.database.name
      port      = aws_db_instance.database.port
  
  }
}