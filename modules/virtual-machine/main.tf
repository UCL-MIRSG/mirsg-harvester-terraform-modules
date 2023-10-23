terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.3"
    }
  }
}

data "harvester_image" "os_image" {
  display_name = var.os_image.display_name
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
    name = "nic-0"
  }

  dynamic "disk" {
    for_each = var.vm_data.disks

    content {
      name        = disk.value.name
      type        = "disk"
      size        = disk.value.size
      bus         = "virtio"
      boot_order  = disk.value.boot_order
      image       = data.harvester_image.os_image.id
      auto_delete = true
    }
  }
  cloudinit {
    user_data    = var.user_data
    network_data = ""
  }
}
