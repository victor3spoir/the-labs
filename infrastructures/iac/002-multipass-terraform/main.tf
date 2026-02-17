resource "multipass_instance" "srv_dev_01" {
  name   = "srv-dev-01"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = var.vm_disk_size

  cloudinit_file="./config/srv-01.yml"
}

resource "multipass_instance" "srv_dev_02" {
  name   = "srv-dev-01"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = var.vm_disk_size

  cloudinit_file="./config/srv-02.yml"
}


