# Defining VM Volume

resource "libvirt_volume" "debian-qcow2" {
  name   = "debian.qcow2"
  pool   = "default" # List storage pools using virsh pool-list
#   source = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"
  source = "/home/cloudgenius/Downloads/debian-11-generic-amd64.qcow2"
  format = "qcow2"
}
