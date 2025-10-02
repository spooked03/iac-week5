  # ESXi Provider Variables
variable "esxi_hostname" {
  type        = string
  default     = "192.168.1.12"
}

variable "esxi_hostport" {
  type        = number
  default     = 22
}

variable "esxi_hostssl" {
  type        = number
  default     = 443
}

variable "esxi_username" {
  type        = string
  default = "root"
}

variable "esxi_password" {
  type        = string
  sensitive   = true
  default     = "Welkom01!"
}

variable "disk_store" {
  type        = string
  default     = "datastore1"
}

# VM Configuration Variables
variable "vm_name" {
  type        = string
  default     = "ubuntu-vm"
}

variable "vm_memory" {
  type        = number
  default     = 2048
}

variable "vm_cpus" {
  type        = number
  default     = 2
}

variable "vm_network" {
  type        = string
  default     = "VM Network"
}

variable "app_name" {
  type        = string
  default     = "demoapp"
}

variable "ssh_private_key" {
  type        = string
  default     = "/home/student/.ssh/id_ed25519-skylab"
  
}

variable "ssh_public_key" {
  type        = string
  default     = "/home/student/.ssh/id_ed25519-skylab.pub"
  
}

variable "ovf_source" {
  type        = string
  default     = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"
}

variable "ansible_username" {
  type        = string
  default     = "nessie"
}