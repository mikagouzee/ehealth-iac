
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
}

variable "subnet_address_prefix" {
  type = string
}

variable "netwok_security_group_name" {
  type = string
}

variable "network_interface_name" {
  type = string
}

variable "public_ip_id" {
  type = string
  default     = ""
}

variable "security_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}

variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}