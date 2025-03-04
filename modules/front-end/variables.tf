variable "resource_group_name" {
  type = string
  description = "RG name in Azure"
  default = "my-rg-default"
}

variable "resource_group_location" {
  type = string
  description = "rg location in azure"
  default = "my-rg-location-default"
}

variable "virtual_network_name" {
  type = string
  description = "vnet in azure"
  default = "my-vnet-default"
}

variable "subnet_name" {
  type = string
  description = "Subnet name in azure"
  default = "my-subnet-default"
}

variable "vnet_address_space" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  type = string
  default = "10.0.1.0/24"
}

variable "public_ip_name" {
  type = string
  description = "Public ip name in azure"
  default = "my-public-ip-default"
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
  default = "front-end"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}