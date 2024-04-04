# Output Server IP
output "ip" {
  value = libvirt_domain.debian.network_interface.0.addresses.0
}
