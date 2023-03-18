locals {
  tags = {
    resource_type = "database"
    env           = var.environment
  }
}

resource "azurerm_mssql_database" "sql_database" {
  name                        = var.sql_database_name
  server_id                   = var.sql_server_id
  license_type                = var.license_type
  sku_name                    = var.sku_name
  read_scale                  = true
  max_size_gb                 = var.max_size_gb
  min_capacity                = var.min_capacity
  zone_redundant              = true
  tags                        = var.custom_tags
}