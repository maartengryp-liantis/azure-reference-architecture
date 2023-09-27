output "loadbalancer" {
  value = data.azurerm_public_ip.public_ip.ip_address
}

output "name" {
  value = var.aks_cluster_name
}

output "resource_group" {
  value = var.resource_group_name
}

output "subscription_id" {
  value = nonsensitive(var.credentials.azure_subscription_id)
}

output "cluster_type" {
  value = "aks"
}

output "credentials" {
  value = {
    appId       = azuread_application.application.application_id
    displayName = azuread_application.application.display_name
    password    = azuread_service_principal_password.password.value
    tenant      = var.credentials.azure_subscription_tenant_id
  }
  sensitive = true
}
