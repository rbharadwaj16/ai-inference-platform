variable "subscription_id" {
  description = "Azure subscription ID for the dev inference platform deployment. Leave null to use Azure CLI or environment authentication."
  type        = string
  default     = null
}

variable "tenant_id" {
  description = "Azure tenant ID for the dev inference platform deployment. Leave null to use Azure CLI or environment authentication."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region for dev infrastructure."
  type        = string
  default     = "eastus"
}

variable "region_code" {
  description = "Short region code used by context-based module naming."
  type        = string
  default     = "eus"
}

variable "environment" {
  description = "Short environment name."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev"], var.environment)
    error_message = "Only the dev environment is wired in this root stack for now."
  }
}

variable "tags" {
  description = "Additional tags applied to all supported resources."
  type        = map(string)
  default     = {}
}

variable "vnet_address_space" {
  description = "Address space for the dev AKS virtual network."
  type        = list(string)
  default     = ["10.40.0.0/16"]
}

variable "aks_system_subnet_address_prefixes" {
  description = "Address prefixes for the AKS system subnet."
  type        = list(string)
  default     = ["10.40.0.0/22"]
}

variable "aks_default_node_pool_vm_size" {
  description = "VM size for the default AKS system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_default_node_pool_node_count" {
  description = "Initial node count for the default AKS system node pool."
  type        = number
  default     = 2
}
