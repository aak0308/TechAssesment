output "id" {
  value     = azurerm_windows_web_app.app.id
  sensitive = true
}

output "default_hostname" {
  value = azurerm_windows_web_app.app.default_hostname
}

output "identity" {
  value = azurerm_windows_web_app.app.identity
}