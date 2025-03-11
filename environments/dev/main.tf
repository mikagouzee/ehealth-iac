module "back" {
    source = "../../modules/back-end"
    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
    virtual_network_name = var.virtual_network_name
    subnet_name = var.subnet_name
    vnet_address_space = var.vnet_address_space
    subnet_address_prefix = var.subnet_address_prefix
    network_security_group_name = var.network_security_group_name
    network_interface_name = var.network_interface_name
    linux_virtual_machine_name = var.linux_virtual_machine_name
    frontend_subnet_address_prefix = var.frontend_subnet_address_prefix
}