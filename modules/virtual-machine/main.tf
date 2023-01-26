terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.0"
    }
  }
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
    user_data = templatefile("./user_data.yml.tftpl", {
      USER_NAME: var.user,
      USER_PASSWORD_HASH: var.password_hash
      USER_PUBLIC_KEY: file(var.public_key_path)
    })
    network_data = ""
  }
}
