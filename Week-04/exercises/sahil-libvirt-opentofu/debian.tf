# Define KVM domain to create
resource "libvirt_domain" "debian" {
  name   = "debian"
  memory = "1024"
  vcpu   = 1
  network_interface {
    network_name = "kvmbridge" # List networks with virsh net-list
  }

  disk {
    volume_id = libvirt_volume.debian-qcow2.id
    # file = "/var/lib/libvirt/images/debian-11-generic-amd64.qcow2"
		file = "/home/cloudgenius/Downloads/debian-11-generic-amd64.qcow2"
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}
