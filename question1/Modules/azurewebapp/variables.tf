variable "ad_app_name" {
  description = "AD App registeration display name"
  type        = string
  default     = ""
}

variable "app_type" {
  description = "App service type i.e app or web"
  type        = string
}

variable "location" {
  description = "Location where the webapp will be created"
  type        = string
  default = "West Europe"
}

variable "app_name" {
  description = "Name of the new App Service resource."
  type        = string
}

variable "slot_name" {
  description = "Name of the slot for the App Service resource."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Name of the resource group for the resource."
  type        = string
}

variable "service_plan_id" {
  description = "(Required) The ID of the Service Plan that this Windows App Service will be created in."
  type        = string
}

variable "https_only" {
  description = "(Optional) Should the Windows Web App require HTTPS connections."
  type        = bool
  default = true
}

variable "client_affinity_enabled" {
  description = "(Optional) Should Client Affinity be enabled?"
  type        = bool
  default = false
}

variable "always_on" {
  description = "(Optional) If this Windows Web App is Always On enabled. Defaults to true."
  type        = bool
  default = true
}

variable "app_command_line" {
  description = "(Optional) The App command line to launch."
  type        = string
  default     = null
}

variable "docker" {
  description = "Either true for docker container else false "
  type        = bool
  default = false
}

variable "current_stack" {
  description = "current_stack - (Optional) The Application Stack for the Windows Web App. Possible values include dotnet, dotnetcore, node, python, php, and java."
  type        = string
  default = "dotnet"
}

variable "docker_container_name" {
  description = "(Optional) The name of the Docker Container. For example azure-app-service/samples/aspnethelloworld."
  type        = string
  default     = null
}

variable "docker_container_registry" {
  description = "(Optional) The registry Host on which the specified Docker Container can be located. For example mcr.microsoft.com."
  type        = string
  default     = null
}

variable "docker_container_tag" {
  description = "(Optional) The Image Tag of the specified Docker Container to use. For example latest."
  type        = string
  default     = null
}

variable "dotnet_version" {
  description = "(Optional) The version of .NET to use when current_stack is set to dotnet. Possible values include v3.0, v4.0, v5.0, and v6.0."
  type        = string
  default = "v4.0"
}

variable "java_container" {
  description = "(Optional) The Java container type to use when current_stack is set to java. Possible values include JAVA, JETTY, and TOMCAT. Required with java_version and java_container_version."
  type        = string
  default = "JAVA"
}

variable "java_container_version" {
  description = "(Optional) The Version of the java_container to use. Required with java_version and java_container."
  type        = string
  default     = "Tomcat"
}

variable "java_version" {
  description = "(Optional) The version of Java to use when current_stack is set to java. Possible values include 1.7, 1.8 and 11. Required with java_container and java_container_version."
  type        = string
  default = "1.8"
}

variable "node_version" {
  description = "(Optional) The version of node to use when current_stack is set to node. Possible values include ~12, ~14, ~16, or ~18."
  type        = string
  validation {
    condition     = contains(["~12","~14","~16", "~18"], upper(var.node_version))
    error_message = "Please provide a valid parameter (~12, ~14, ~16, or ~18)."
  }
  default = "~18"
}

variable "php_version" {
  description = "(Optional) The version of PHP to use when current_stack is set to php. Possible values include 7.4."
  type        = string
  default     = "8.2"
}

variable "python_version" {
  description = "(Optional) The version of Python to use when current_stack is set to python. Possible values include 2.7 and 3.4.0."
  type        = string
  default = null
}

variable "allowed_origins" {
  description = "(Required) Specifies a list of origins that should be allowed to make cross-origin calls."
  type        = list(string)
  default     = []
}

variable "support_credentials" {
  description = "(Optional) Whether CORS requests with credentials are allowed. Defaults to false."
  type        = bool
  default = false
}

variable "default_documents" {
  description = "(Optional) Specifies a list of Default Documents for the Windows Web App."
  type        = list(string)
  default     = []
}

variable "ftps_state" {
  description = "(Optional) The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled."
  type        = string
  default = "Disabled"
}

variable "health_check_path" {
  description = "(Optional) health check path for the app."
  type        = string
  default     = "/"
}

variable "health_check_eviction_time_in_min" {
  description = "(Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path."
  type        = number
  default = 10
}

variable "http2_enabled" {
  description = "(Optional) Should the HTTP2 be enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.http2_enabled)))
    error_message = "Please provide valid parameter (true or false)."
  }
  default = true
}

variable "load_balancing_mode" {
  description = "(Optional) The Site load balancing. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.value."
  type        = string
  validation {
    condition     = contains(["WeightedRoundRobin", "LeastRequests", "LeastResponseTime", "WeightedTotalTraffic", "RequestHash", "PerSiteRoundRobin"], title(var.load_balancing_mode))
    error_message = "Please provide valid variable (WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash or PerSiteRoundRobin)."
  }
  default = "LeastRequests"
}


variable "identity_type" {
  description = "(Required) Specifies the type of Managed Service Identity that should be configured on this Windows Web App. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
  type        = string
  validation {
    condition     = contains(["SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"], title(var.identity_type))
    error_message = "Please provide valid variable (SystemAssigned, UserAssigned or SystemAssigned, UserAssigned)."
  }
  default = "SystemAssigned"
}

variable "identity_ids" {
  description = "(Optional) A list of User Assigned Managed Identity IDs to be assigned to this Windows Web App."
  type        = list(string)
  default     = null
}

variable "app_settings" {
  description = "Appplication settings."
  type        = map(any)
  default     = {}
}

variable "custom_tags" {
  description = "Custom tags."
  type        = map(any)
  default     = {}
}

variable "keyvault_map_to_add_access_policy" {
  description = "Map of Keyvault & Resource Group name to add access policy to this function app."
  type        = map(map(string))
  default     = {}
  # Example
  # keyvault_map_to_add_access_policy = {
  #   prime = {
  #     name                = "kyva1"
  #     resource_group_name = "rgpa1"
  #   }
  #   secondary = {
  #     name                = "kyva2"
  #     resource_group_name = "rgpa2"
  #   }
  # }
}