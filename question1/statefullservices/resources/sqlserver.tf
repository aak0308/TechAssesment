module "sqlserver_primary" {
  source = "../../Modules/sqlserver"

  resource_group_name = data.azurerm_resource_group.rg.name
  primary_location    = var.mssql["primary_location"]
  secondary_location  = var.mssql["secondary_location"]
  failover_enabled    = var.mssql["failover_enabled"]
  custom_tags         = var.custom_tags
  env                 = var.environment
  sql_server_name        = var.mssql["name"]
  version_number         = var.mssql["version"]
  administrator_login    = "sqladmin-${var.environment}"
  key_vault_id           = data.azurerm_key_vault.keyvault.id
  key_prefix             = var.mssql["key_prefix"]
  sqladminadgroupname    = var.mssql["sqladminadgroupname"]
  identityenabled        = false
  password_rotation_days = var.mssql["password_rotation_days"]
}