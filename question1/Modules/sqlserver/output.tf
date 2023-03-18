output "id" {
  value = azurerm_mssql_server.sqlsrv.id
}

output "fqdn" {
  value = azurerm_mssql_server.sqlsrv.fully_qualified_domain_name
}

output "name" {
  value = azurerm_mssql_server.sqlsrv.name
}

output "resource-group-name" {
  value = azurerm_mssql_server.sqlsrv.resource_group_name
}

output "password_rotation_date" {
  value = time_rotating.rotation.rotation_rfc3339
}

output "principal-id" {
  value = var.identityenabled == false ? "Identity not enabled" : azurerm_mssql_server.sqlsrv.identity[0].principal_id
}