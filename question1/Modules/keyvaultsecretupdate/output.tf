output "key_id" {
  value = {
    for instance in azurerm_key_vault_secret.secret_updation :
    instance.id => instance.id
  }
  description = "Key Vault Secret ID"
}

output "key_name" {
  value = {
    for instance in azurerm_key_vault_secret.secret_updation :
    instance.name => instance.name
  }
  description = "Key Vault Secret Name"
}