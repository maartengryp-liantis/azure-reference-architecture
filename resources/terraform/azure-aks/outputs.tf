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

output "credentials" {
  value = jsonencode(
        {
          appId       = azuread_application.application.application_id
          displayName = azuread_application.application.display_name
          password    = azuread_service_principal_password.password.value
          tenant      = var.credentials.azure_subscription_tenant_id
        })
  sensitive = true
}