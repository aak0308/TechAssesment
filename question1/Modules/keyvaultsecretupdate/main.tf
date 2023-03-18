data "azurerm_key_vault" "kv" {
  count               = var.key_vault_id != null ? 0 : 1
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_secret" "secret_updation" {
  for_each     = var.secrets_updates
  name         = each.value.name
  value        = each.value.value
  key_vault_id = var.key_vault_id == null ? data.azurerm_key_vault.kv[0].id : var.key_vault_id
  tags         = merge(module.dataprovider.tags, var.custom_tags)
}