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
  default = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  type = string
}

variable "network_security_group_name" {
  type = string
  description = "NSG name in azure"
}

variable "network_interface_name" {
  type = string
  description = "NIC name in azure"
}

variable "linux_virtual_machine_name" {
  type = string
  description = "Linux VM name in azure"
}

variable "frontend_subnet_address_prefix" {
  type = string
}