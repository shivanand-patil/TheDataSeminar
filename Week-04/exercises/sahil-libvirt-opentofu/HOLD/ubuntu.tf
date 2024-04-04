# Defining VM Volume
resource "libvirt_volume" "ubuntu-img" {
  name   = "ubuntu.img"
  pool   = "default" # List storage pools using virsh pool-list
  source = "/home/cloudgenius/Downloads/jammy-server-cloudimg-amd64-disk-kvm.img"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.yaml")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool = "default"
}

# Define KVM domain to create
resource "libvirt_domain" "ubuntu" {
  name   = "ubuntu"
  memory = "1024"
  vcpu   = 1

  network_interface {
    network_name = "default" # List networks with virsh net-list
  }

  disk {
    volume_id = libvirt_volume.ubuntu-img.id
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

# Output Server IP
# output "ip" {
#   value = libvirt_domain.ubuntu.network_interface.0.addresses.0
# }
