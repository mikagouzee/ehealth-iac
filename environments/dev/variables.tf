variable "resource_group_name" {
  type = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type = string
  description = "rg location in azure"
}

variable "virtual_network_name" {
  type = string
  description = "vnet in azure"
}

variable "subnet_name" {
  type = string
  description = "Subnet name in azure"
}

variable "vnet_address_space" {
  type = string
}

variable "subnet_address_prefix" {
  type = string
}

variable "network_security_group_name" {
  type = string
  description = "NSG name in azure"
  default = "nsg-name-default"
}

variable "network_interface_name" {
  type = string
  description = "NIC name in azure"
  default = "my-nic-default"
}

variable "linux_virtual_machine_name" {
  type = string
  description = "Linux VM name in azure"
}

variable "frontend_subnet_address_prefix" {
  type = string
  default = "10.5.1.0/24"
}