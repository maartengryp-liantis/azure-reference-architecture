variable "credentials" {
  description = "The credentials for connecting to Azure."
  type = object({
    azure_subscription_id         = string
    azure_subscription_tenant_id  = string
    service_principal_id          = string
    service_principal_password    = string
  })
  sensitive = true
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group to use"
  type        = string
}

variable "location" {
  description = "Location of the Azure resources"
  type        = string
}

variable "node_size" {
  description = "AKS default node pool's node size"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "existing_acr_name" {
  description = "Name of the existing ACR to attach to AKS"
  type        = string
}