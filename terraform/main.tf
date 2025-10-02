resource "esxi_guest" "web" {
  count      = 1
  guest_name = "web-week5"
  disk_store = var.disk_store
  memsize    = var.vm_memory
  numvcpus   = var.vm_cpus

  ovf_source = var.ovf_source

  network_interfaces {
    virtual_network = var.vm_network
  }

  # Cloud-init configuration
  guestinfo = {
    "userdata.encoding" = "base64"
    "userdata"          = filebase64("../cloudinit/userdata.yaml")

    "metadata.encoding" = "base64"
    "metadata"          = filebase64("../cloudinit/metadata.yaml")
  }
}

# Generate Ansible inventory after IPs are available
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/../templates/inventory.tpl", {
    web_vms = esxi_guest.web
  })
  filename = "${path.module}/../ansible/inventory.yaml"

  # depends_on = [null_resource.wait_for_ips]
}

# Outputs
output "vm_ip" {
  description = "IP of the Ubuntu VM"
  value       = esxi_guest.web[0].ip_address
}

output "vm_name" {
  description = "Name of the Ubuntu VM"
  value       = esxi_guest.web[0].guest_name
}

output "ssh_connection_command" {
  description = "SSH command to connect to the VM"
  value       = "ssh -i ~/.ssh/id_ed25519-skylab ubuntu@${esxi_guest.web[0].ip_address}"
}

output "ansible_inventory_file" {
  description = "Path to the generated Ansible inventory file"
  value       = "${path.module}/ansible/inventory.yaml"
}
