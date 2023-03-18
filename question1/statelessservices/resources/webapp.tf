module "app_service_plan" {
  source              = "../../Modules/appserviceplan"
  env                 = var.env
  custom_tags         = local.custom_tags
  os_type             = var.os_type
  aps_name            = var.aps_name
  sku_name            = var.sku_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "app_service_frontend" {
  source                             = "../../Modules/azurewebapp"
  app_name                           = var.app_name_frontend 
  app_service_plan_id                = module.app_service_plan.id
  location                           = module.app_service_plan.location
  https_only                         = true
  always_on                          = true
  env                                = var.env
  identity_type                      = var.identity_type
  identity_ids                       = var.identity_ids
  client_affinity_enabled            = var.client_affinity_enabled
  custom_tags                        = var.custom_tags
  default_documents                  = var.default_documents
  resource_group_name                = var.resource_group_name
  ip_restrictions                    = var.ip_restrictions_gateway
  app_settings                       = var.app_settings
  health_check_path                  = var.health_check_path
  node_version                       = var.node_version
}

module "app_service_backend" {
  source                             = "../../Modules/azurewebapp"
  app_name                           = var.app_name_backend
  app_service_plan_id                = module.app_service_plan.id
  location                           = module.app_service_plan.location
  https_only                         = true
  always_on                          = true
  env                                = var.env
  identity_type                      = var.identity_type
  identity_ids                       = var.identity_ids
  client_affinity_enabled            = var.client_affinity_enabled
  custom_tags                        = var.custom_tags
  default_documents                  = var.default_documents
  resource_group_name                = var.resource_group_name
  ip_restrictions                    = var.ip_restrictions_gateway
  app_settings                       = var.app_settings
  health_check_path                  = var.health_check_path
  dotnet_framework_version           = var.dotnet_framework_version
}