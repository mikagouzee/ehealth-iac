module "rg" {
  source = "../resource-group"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "network" {
  source = "../network"
  virtual_network_name = var.virtual_network_name
  subnet_name = var.subnet_name
  vnet_address_space = var.vnet_address_space
  subnet_address_prefix = var.subnet_address_prefix
  netwok_security_group_name = var.netwok_security_group_name
  network_interface_name = var.network_interface_name
  public_ip_id = azurerm_public_ip.controlIP.id
  security_rules = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

resource "azurerm_linux_virtual_machine" "back-end" {
  name                            = var.linux_virtual_machine_name
  location                        = module.rg.location
  resource_group_name             = module.rg.name
  network_interface_ids           = [module.network.nicId]
  size                            = "Standard_DS1_v2"
  computer_name                   = "controlnode"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }  

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }
  
}


