variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sql_name" {
  type = string
}

variable "version_number" {
  default = "12.0"
  type    = string
}

variable "administrator_login" {
  type = string
}

variable "custom_tags" {
  default = {}
}

variable "env" {
  description = "env of the resource group and resources in Azure."
  type        = string
  validation {
    condition     = contains(["dev", "prod"], lower(var.env))
    error_message = "Please provide valid environment name (dev or prod)."
  }
}

variable "key_prefix" {
  description = "Keyvault secret prefix"
  type        = string
}

variable "key_vault_id" {
  description = "Keyvault name to update the secret"
  type        = string
}

variable "sqladminadgroupname" {
  description = "Name of of Azure AD Group which is to be assigned as Admin for SQL Server"
  default     = null
  type        = string
}

variable "identityenabled" {
  description = "Enable System Assigned Identity on SQL Server"
  default     = false
  type        = bool
}

variable "password_rotation_days" {
  description = "Number of days to rotate password"
  default     = 30
  type        = number
}