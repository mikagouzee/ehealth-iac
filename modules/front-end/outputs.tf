output "public_ip" {
  value = data.azurerm_public_ip.ip
}

output "private_key" {
    value = tls_private_key.ssh_key.private_key_openssh
    sensitive = true
}

output "vm_id"{
  value = azurerm_linux_virtual_machine.front-end.id
}