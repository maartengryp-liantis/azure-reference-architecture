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

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "ingress_nginx_public_ip_address_name" {
  description = "Name of the Nginx Ingress controller public IP address"
  type        = string
  default     = "${var.aks_cluster_name}-ingress-nginx"
}