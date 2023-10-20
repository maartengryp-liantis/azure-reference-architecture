# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/redis_cache
data "azurerm_redis_cache" "redis" {
  name                = var.redis_name
  resource_group_name = var.resource_group_name
}