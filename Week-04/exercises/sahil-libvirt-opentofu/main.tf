terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

provider "libvirt" {
  # Configuration options
  # uri = "qemu+ssh://cloudgenius@venus.cg.home.arpa/system"
	uri = "qemu:///system"
}
