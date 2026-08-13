variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "demo-vm"
}

variable "vm_memory" {
  description = "Memory for each VM"
  type        = string
  default     = "1G"
}

variable "vm_cpus" {
  description = "Number of CPUs for each VM"
  type        = number
  default     = 1
}

variable "vm_disk_size" {
  description = "Disk size for each VM"
  type        = string
  default     = "10G"
}

variable "image" {
  description = "Image to use for VMs"
  type        = string
  default     = "24.04"
}