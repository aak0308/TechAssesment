variable "sql_database_name" {
  type        = string
  description = "Name of Database"
}

variable "sql_server_id" {
  type        = string
  description = "ID SQL Server"
}

variable "max_size_gb" {
  description = "The max size of the database in gigabytes"
  type        = number
  default     = 100
}

variable "custom_tags" {
  default     = {}
  description = "Tags for the resource"
}

variable "env" {
  description = "env of the resource group and resources in Azure."
  validation {
    condition     = contains(["dev","prod"], lower(var.env))
    error_message = "Please provide valid environment name (dev or prod)."
  }
}

variable "sku_name" {
  description = "Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Check existing Database on azure portal and find the value from JSON view. Either elastic_pool_name or sku_name should be passed, elastic_pool_name supersedes sku_name."
  type        = string
  default     = "GP_Gen5"
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

variable "license_type" {
  default     = "LicenseIncluded"
  type        = string
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice"
  validation {
    condition     = contains(["LicenseIncluded", "BasePrice"], var.license_type)
    error_message = "(Case Sensitive). Accepted values for License Type are LicenseIncluded and BasePrice."
  }
}