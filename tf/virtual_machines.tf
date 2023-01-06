resource "harvester_virtualmachine" "web" {

  name        = var.web_vm_data.name
  namespace   = var.web_vm_data.namespace
  description = var.web_vm_data.description

  hostname = var.web_vm_data.hostname
  tags     = var.web_vm_data.tags

  cpu    = var.web_vm_data.cpus
  memory = var.web_vm_data.memory

  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
  }

  disk {
    name        = var.web_vm_data.disks[0].name
    type        = "disk"
    size        = var.web_vm_data.disks[0].size
    bus         = "virtio"
    boot_order  = var.web_vm_data.disks[0].boot_order
    image       = data.harvester_image.os_image.id
    auto_delete = true
  }

  disk {
    name        = var.web_vm_data.disks[1].name
    type        = "disk"
    size        = var.web_vm_data.disks[1].size
    bus         = "virtio"
    boot_order  = var.web_vm_data.disks[1].boot_order
    auto_delete = true
  }

  cloudinit {
    user_data = templatefile("../scripts/user_data.yml.tftpl", {
      USER_NAME: var.USER_NAME,
      USER_PASSWORD_HASH: var.USER_PASSWORD_HASH
      USER_PUBLIC_KEY: file(var.USER_PUBLIC_KEY_PATH)
    })
    network_data = ""
  }
}

resource "harvester_virtualmachine" "db" {

  name        = var.db_vm_data.name
  namespace   = var.db_vm_data.namespace
  description = var.db_vm_data.description

  hostname = var.db_vm_data.hostname
  tags     = var.db_vm_data.tags

  cpu    = var.db_vm_data.cpus
  memory = var.db_vm_data.memory

  run_strategy = "RerunOnFailure"

  network_interface {
    name         = "nic-0"
  }

  disk {
    name        = var.db_vm_data.disks[0].name
    type        = "disk"
    size        = var.db_vm_data.disks[0].size
    bus         = "virtio"
    boot_order  = var.db_vm_data.disks[0].boot_order
    image       = data.harvester_image.os_image.id
    auto_delete = true
  }

  disk {
    name        = var.db_vm_data.disks[1].name
    type        = "disk"
    size        = var.db_vm_data.disks[1].size
    bus         = "virtio"
    boot_order  = var.db_vm_data.disks[1].boot_order
    auto_delete = true
  }

  cloudinit {
    user_data = templatefile("../scripts/user_data.yml.tftpl", {
      USER_NAME: var.USER_NAME,
      USER_PASSWORD_HASH: var.USER_PASSWORD_HASH
      USER_PUBLIC_KEY: file(var.USER_PUBLIC_KEY_PATH)
    })
    network_data = ""
  }
}
