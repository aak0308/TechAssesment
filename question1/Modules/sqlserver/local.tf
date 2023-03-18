locals {
    tags = {
    resource_type = "databaseAccount"
    env           = var.env
  }
  secrets_updates = {
    sqladminusername = {
      name  = format("%s%s", var.key_prefix, "--sqlserver--admin--username")
      value = var.administrator_login
    }
    sqladminpassword = {
      name  = format("%s%s", var.key_prefix, "--sqlserver--admin--password")
      value = azurerm_mssql_server.sqlsrv.administrator_login_password
    }
    sqlfqdn = {
      name  = format("%s%s", var.key_prefix, "--sqlserver--fqdn")
      value = azurerm_mssql_server.sqlsrv.fully_qualified_domain_name
    }
  }
}