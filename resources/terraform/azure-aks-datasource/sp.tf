data "azuread_client_config" "current" {}

# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application
resource "azuread_application" "application" {
  display_name = "humanitec-to-${var.aks_cluster_name}"
}

resource "azuread_service_principal" "principal" {
  application_id = azuread_application.application.application_id
}

resource "azuread_service_principal_password" "password" {
  service_principal_id = azuread_service_principal.principal.id
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
resource "azurerm_role_assignment" "aks_admin" {
  scope                = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = azuread_service_principal.principal.id
}