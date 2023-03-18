output "name" {
  description = "Key Vault Name"
  value       = azurerm_key_vault.hosting.name
}

output "key-vault-id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.hosting.id
  sensitive   = true
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.hosting.vault_uri
  sensitive   = true
}