module "shared_key_vault" {
    source                      = "../../Modules/Keyvault"
    kv_name                     = var.key_vault_name
    resource_group_name         = data.azurerm_resource_group.rg.name
    location                    = data.azurerm_resource_group.rg.location
    custom_tags                 = var.custom_tags
    soft_delete_retention_days  = var.soft_delete_retention_days
    env                         = var.environment
    purge_protection_enabled  = false
}