resource "multipass_instance" "srv_01" {
  name   = "srv-01"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = var.vm_disk_size

  cloudinit_file = "${path.module}/config/srv-01.yml"
}

resource "multipass_instance" "srv_02" {
  name   = "srv-02"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = var.vm_disk_size

  cloudinit_file = "${path.module}/config/srv-02.yml"
}


