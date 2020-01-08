output "sql_server_fqdn" {
  value = "${azurerm_sql_server.someproduct.fully_qualified_domain_name}"
}
output "database_password" {
  value = "${random_password.dbpassword.result}"
}
output "app_url" {
  value = "${azurerm_app_service.someproduct.name}.azurewebsites.net"
}
