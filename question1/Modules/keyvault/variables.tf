variable "resource_group_name" {
  type        = string
  description = "The name of an existing Resource Group"
}

variable "location" {
  type        = string
  default = "Central US"
}

variable "kv_name" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default = true
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default = true
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default = true
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  validation {
    condition     = contains(["standard", "premium"], lower(var.sku_name))
    error_message = "Please provide valid parameter (true or false)."
  }
  default = "standard"
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  type        = number
  validation {
    condition     = can(regex("([7-9]|[1-9][0-0])", tonumber(var.soft_delete_retention_days)))
    error_message = "Please provide valid number of days between (7 and 90)."
  }
  default = 90
}


variable "custom_tags" {
  default = {}
}

variable "env" {
  description = "env of the resource group and resources in Azure."
  validation {
    condition     = contains(["dev", "prod"], lower(var.env))
    error_message = "Please provide valid environment name (dev or prod)."
  }
}

variable "purge_protection_enabled" {
  description = "Enable Purge Protection enabled"
  type        = bool
  default = true
}

variable "certificate_permissions" {
  description = "List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
  type    = list(string)
  default = ["List"]
}

variable "key_permissions" {
  description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
  type    = list(string)
  default = ["List"]
}

variable "secret_permissions" {
  description = "List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
  type    = list(string)
  default = ["List"]
}

variable "storage_permissions" {
  description = "List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
  type    = list(string)
  default = ["List"]
}