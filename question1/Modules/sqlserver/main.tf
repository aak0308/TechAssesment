locals {

}

resource "time_rotating" "rotation" {
  rotation_days = var.password_rotation_days
}

resource "random_password" "password" {
  length           = 16
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"

  keepers = {
    rotation = time_rotating.rotation.id
  }
}

resource "azurerm_mssql_server" "sqlsrv" {
  name                         = var.sql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version_number
  minimum_tls_version          = "1.2"
  administrator_login          = var.administrator_login
  administrator_login_password = random_password.password.result
  tags                         = var.custom_tags

  dynamic "azuread_administrator" {
    for_each = toset(var.sqladminadgroupname == null ? [] : [1])
    content {
      login_username              = data.azuread_group.sqladminadgroup[0].display_name
      object_id                   = data.azuread_group.sqladminadgroup[0].object_id
      azuread_authentication_only = false
    }
  }

  dynamic "identity" {
    for_each = toset(var.identityenabled == false ? [] : [1])
    content {
      type = "SystemAssigned"
    }
  }
}

module "keyvaultsecretupdate" {
  source = "../KeyVaultSecretUpdate"

  secrets_updates = local.secrets_updates
  key_vault_id    = var.key_vault_id
  custom_tags     = var.custom_tags
}

data "azuread_group" "sqladminadgroup" {
  count        = var.sqladminadgroupname == null ? 0 : 1
  display_name = var.sqladminadgroupname
}