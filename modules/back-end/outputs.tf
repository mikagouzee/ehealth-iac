output "controlnode_public_ip" {
  value = data.azurerm_public_ip.controlIP.ip_address
}

output "controlnode_identity_client_id" {
  value = azurerm_linux_virtual_machine.controlnode.identity[0].principal_id
}

output "private_key" {
    value = tls_private_key.ssh_key.private_key_openssh
    sensitive = true
}