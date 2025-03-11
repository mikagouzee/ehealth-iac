resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_address_space]
  location            = var.rg_location
  resource_group_name = var.rg_name

}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.netwok_security_group_name
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "nsg_rule" {
  for_each = { for rule in var.security_rules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "myNicConfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id != "" ? var.public_ip_id : null
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
