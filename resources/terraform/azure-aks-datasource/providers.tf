terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.41.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id             =  var.credentials.azure_subscription_id
  tenant_id                   =  var.credentials.azure_subscription_tenant_id
  client_id                   =  var.credentials.service_principal_id
  client_secret               =  var.credentials.service_principal_password
  skip_provider_registration  = true
}

provider "azuread" {
  tenant_id       = var.credentials.azure_subscription_tenant_id
  client_id       = var.credentials.service_principal_id
  client_secret   = var.credentials.service_principal_password
  use_cli         = false
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}