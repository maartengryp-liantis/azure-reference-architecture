terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
    helm = {
      source = "hashicorp/helm"
    }
    random = {
      source  = "hashicorp/random"
    }
  }
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

provider "helm" {
  kubernetes {
    host                    = azurerm_kubernetes_cluster.aks.kube_config.0.host
    client_certificate      = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
    client_key              = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
    cluster_ca_certificate  = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
  }
}