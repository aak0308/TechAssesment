variable "custom_tags" {
  default = {
    "env" = "dev"
  }
}

variable "key_vault_name" {
    type = string
    description = "name of the keyvault"
}


variable "soft_delete_retention_days" {
    type = string
    description = "Number for soft delete retention days"
}

variable "environment" {
    type = string
    description = "environment name"
}

variable "location" {
    type = string
    description = "location name"
}


variable "resource_group_name" {
    type = string
    description = "resource group name"
}

variable "mssql" {
  type    = map(any)
  default = {}
}

variable "sql_databases_list" {
  type = map(object({
    collation                   = string
    database_max_size_gb        = number
    datawarehouse               = bool
    backup_storage_account_type = string
  }))
  default = {
    "database_name" = {
      database_max_size_gb        = 10
      datawarehouse               = false
      backup_storage_account_type = "Local"
    }
  }
}

variable "min_capacity" {
  description = "Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases"
  type        = number
  default     = 1
  validation {
    condition     = contains([0, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 3, 4, 5, 6, 8, 10, 12, 14, 16, 18, 20, 24, 32, 40], var.min_capacity)
    error_message = "Accepted values are 0, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 3, 4, 5, 6, 8, 10, 12, 14, 16, 18, 20, 24, 32, 40."
  }
}