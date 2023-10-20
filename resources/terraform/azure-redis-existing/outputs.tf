output "password" {
  value     = data.azurerm_redis_cache.redis.primary_access_key
  sensitive = true
}

output "host" {
  value = data.azurerm_redis_cache.redis.hostname
}

output "port" {
  value = data.azurerm_redis_cache.redis.ssl_port
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
