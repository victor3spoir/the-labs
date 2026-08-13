resource "multipass_instance" "srv_master" {
  name   = "srv-master"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = "20G"

  cloudinit_file = "${path.module}/config/srv-master.yml"
}

resource "multipass_instance" "srv_worker" {
  name   = "srv-worker"
  image  = var.image
  cpus   = var.vm_cpus
  memory = var.vm_memory
  disk   = "10G"

  cloudinit_file = "${path.module}/config/srv-worker.yml"
}


