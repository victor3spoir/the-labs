resource "multipass_instance" "srv_gateway" {
  name   = "srv-gateway"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = var.vm_disk_size

  cloudinit_file = "${path.module}/configs/srv-gateway.yml"
}
