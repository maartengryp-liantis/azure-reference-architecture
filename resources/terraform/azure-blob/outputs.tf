output "container" {
  value = azurerm_storage_container.storage_container.name
}

output "account" {
  value = azurerm_storage_account.storage_account.name
}

output "encoded_account" {
  value = base64encode(azurerm_storage_account.storage_account.name)
}

output "account_access_key" {
  value = base64encode(azurerm_storage_account.storage_account.primary_access_key)
  sensitive = true
}