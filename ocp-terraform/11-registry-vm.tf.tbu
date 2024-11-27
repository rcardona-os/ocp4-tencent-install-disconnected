# Create a Public IP for Internet Access
resource "azurerm_public_ip" "registry_public_ip" {
  name                = "registry-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"  # Use "Static" instead of "Dynamic" for Standard SKU
  sku                 = "Standard"  # Specify Standard SKU if needed
  domain_name_label   = "registry"  # Set a unique DNS label here
  depends_on          = [azurerm_virtual_network.vnet]  # Explicit dependency on VNet
}

# Create a DNS A record in the private DNS zone
resource "azurerm_private_dns_a_record" "registry_a_record" {
  name                = "registry"  # This will create "registry.ocp-private.com"
  zone_name           = azurerm_private_dns_zone.ocp_private_dns_zone.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300  # Time to live in seconds
  records             = [azurerm_network_interface.registry_nic.private_ip_address]  # Private IP of the NIC
}

# Define a Network Interface
resource "azurerm_network_interface" "registry_nic" {
  name                = "registry-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.registry_public_ip.id
  }
}

# Associate the Network Security Group with the Network Interface
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.registry_nic.id
  network_security_group_id =  azurerm_network_security_group.public_nsg.id
}

# Define the Virtual Machine (VM)
resource "azurerm_linux_virtual_machine" "registry" {
  name                = "registry"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_B2as_v2"  # 2 vCPUs, 8 GB RAM
  admin_username      = "ocpuser"

  network_interface_ids = [
    azurerm_network_interface.registry_nic.id
  ]

  admin_ssh_key {
    username   = "ocpuser"
    public_key = file(var.ssh_key_path)  # Path to your SSH public key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 300  # Increase the disk size to 128GB
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9_2"
    version   = "latest"
  }

  computer_name  = "registry"
  disable_password_authentication = true
}