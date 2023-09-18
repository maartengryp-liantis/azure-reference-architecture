output "loadbalancer" {
  value =  var.ingress_nginx_public_ip_address
}

output "name" {
  value = var.aks_cluster_name
}

output "resource_group" {
  value = var.resource_group_name
}

output "subscription_id" {
  value = var.credentials.azure_subscription_id
  sensitive = true
}

output "sp_application_id" {
  value = azuread_application.application.application_id
  sensitive = true
}

output "sp_display_name" {
  value = azuread_application.application.display_name
  sensitive = true
}

output "sp_password" {
  value = azuread_service_principal_password.password.value
  sensitive = true
}

output "sp_tenant_id" {
  value = var.credentials.azure_subscription_tenant_id
  sensitive = true
}
