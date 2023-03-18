data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "hosting" {
  name                            = var.kv_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku_name                        = var.sku_name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_deployment          = var.enabled_for_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled 

  tags = var.custom_tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    storage_permissions     = var.storage_permissions
    certificate_permissions = var.certificate_permissions
  }
  
  lifecycle {
    ignore_changes = [access_policy]
  }
}