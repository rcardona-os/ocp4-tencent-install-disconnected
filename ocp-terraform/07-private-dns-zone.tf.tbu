# Create the Private DNS Zone
resource "azurerm_private_dns_zone" "ocp_private_dns_zone" {
  name                = var.private_domain
  resource_group_name = azurerm_resource_group.rg.name
}

# Link the DNS Zone to a Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "ocp_private_vnet_link" {
  name                  = "ocp-private-vnet-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.ocp_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id

  # Enable auto-registration of DNS records
  registration_enabled = true
}
