output "public_ip_address" {
  value =  data.azurerm_public_ip.ingress_nginx.ip_address
}