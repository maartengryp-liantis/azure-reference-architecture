resource "random_string" "aks_name" {
  length  = 10
  special = false
  lower   = true
  upper   = false
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = random_string.aks_name.result
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = random_string.aks_name.result

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.node_size
  }

  identity {
    type = "SystemAssigned"
  }
}