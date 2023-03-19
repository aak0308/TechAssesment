variable "resource_group_name" {
  description = "The name of the resource group in which to create the zone resources."
  type        = string
  default     = null
}

variable "key_vault_name" {
  description = "The name of the keyvault for secret updation."
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "The id of the keyvault for secret updation. This supersedes keyvault name and resource group name variable"
  type        = string
  default     = null
}

variable "secrets_updates" {
  description ="(Optional) Secret key value pair details to be updated in the keyvault"
  type        = map(any)
  default     = {}
}
#Example
#sqlusername= {
#  name   =  format("%s%s", var.key_prefix ,"sql-server-username" )
#  value  = "admin"
#}

variable "custom_tags" {
    type = string
    default = {}
}