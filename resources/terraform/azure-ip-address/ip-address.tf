# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip
data "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_address_name
  resource_group_name = var.resource_group_name
}