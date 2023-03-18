module "sql_database" {
  source                               = "../../Modules/sqldatabase"
  for_each                             = var.sql_databases_list
  env                                  = var.env
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  sql_server_id                        = module.sqlserver_primary.id
  min_capacity                         = var.min_capacity
  sql_database_name                    = each.key
  max_size_gb                          = each.value.database_max_size_gb
  auto_pause_delay_in_minutes          = 0
  custom_tags                          = var.custom_tags
}

 