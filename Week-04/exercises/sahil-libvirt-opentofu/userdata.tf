data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.yaml")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool = "default"
}
