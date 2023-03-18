resource "azurerm_windows_web_app" "app" {
  name                    = var.app_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  service_plan_id         = var.service_plan_id
  https_only              = var.https_only
  client_affinity_enabled = var.client_affinity_enabled

  site_config {
    always_on        = var.always_on
    app_command_line = var.app_command_line

    application_stack {
      current_stack             = var.docker ? null : var.current_stack
      docker_container_name     = var.docker ? var.docker_container_name : null
      docker_container_registry = var.docker ? var.docker_container_registry : null
      docker_container_tag      = var.docker ? var.docker_container_tag : null
      dotnet_version            = var.docker ? null : var.dotnet_version
      node_version              = var.docker ? null : var.node_version
      php_version               = var.docker ? null : var.php_version
      python_version            = var.docker ? null : var.python_version
    }

    cors {
      allowed_origins     = var.allowed_origins
      support_credentials = var.support_credentials
    }

    health_check_path                 = var.health_check_path
    health_check_eviction_time_in_min = var.health_check_eviction_time_in_min
    http2_enabled                     = var.http2_enabled
    load_balancing_mode               = var.load_balancing_mode
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  app_settings = var.app_settings
  tags         = var.custom_tags

  lifecycle {
    ignore_changes = [
      app_settings,
      tags
    ]
  }
}

module "keyvaultAccessPolicy" {
  source              = "../KeyvaultAccessPolicy"
  for_each            = var.keyvault_map_to_add_access_policy
  key_vault           = each.value.name
  resource_group_name = each.value.resource_group_name
  tenant_id           = azurerm_windows_web_app.app.identity[0].tenant_id
  object_id           = azurerm_windows_web_app.app.identity[0].principal_id
  secret_permissions  = ["Get", "List"]
}