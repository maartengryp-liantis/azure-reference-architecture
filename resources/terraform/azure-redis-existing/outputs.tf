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