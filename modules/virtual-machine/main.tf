terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.0"
    }
  }
}

data "harvester_image" "os_image" {
  display_name =  var.os_image.display_name
}


resource "harvester_virtualmachine" "vm" {

  name        = var.vm_data.name
  namespace   = var.vm_data.namespace
  description = var.vm_data.description

  hostname = var.vm_data.hostname
  tags     = var.vm_data.tags

  cpu    = var.vm_data.cpus
  memory = var.vm_data.memory

  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
  }

  disk {
    name        = var.vm_data.disks[0].name
    type        = "disk"
    size        = var.vm_data.disks[0].size
    bus         = "virtio"
    boot_order  = var.vm_data.disks[0].boot_order
    image       = data.harvester_image.os_image.id
    auto_delete = true
  }

  disk {
    name        = var.vm_data.disks[1].name
    type        = "disk"
    size        = var.vm_data.disks[1].size
    bus         = "virtio"
    boot_order  = var.vm_data.disks[1].boot_order
    auto_delete = true
  }

  cloudinit {
    user_data = var.user_data
    network_data = ""
  }
}
