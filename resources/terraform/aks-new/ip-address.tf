# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "public_ip" {
  name                = random_string.aks_name.result
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_role_assignment" "network_contributor" {
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name             = "Network Contributor"
  scope                            = data.azurerm_resource_group.rg.id
  skip_service_principal_aad_check = true
}
