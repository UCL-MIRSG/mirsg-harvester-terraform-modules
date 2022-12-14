variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = ""
}

variable "os_image" {
  description = "OS image for virtual machines"
  type = object({
    name         = string
    namespace    = string
    display_name = string
    description  = string
    source_type  = string
    url          = string
    tags         = map(string)
  })
  default = {
    name         = "centos7"
    namespace    = "default"
    display_name = "centos7"
    description  = ""
    source_type  = "download"
    url          = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
    tags         = { "format" = "qcow2" }
  }
}

variable "vm_network" {
  description = "network for virtual machines"
  type = object({
    name    = string
    namespace = string
    route_mode = string
    route_dhcp_server_ip = string
  })
  default = {
    name    = "mgmt-vlan1"
    namespace = "default"
    route_mode = "auto"
    route_dhcp_server_ip = ""
  }
}

variable "web_vm_data" {
  description = "parameters for web virtual machine"
  type = object({
    name        = string
    namespace   = string
    description = string
    hostname    = string
    tags        = map(string)
    cpus        = number
    memory      = string
    disks = list(
      object({
        name       = string
        size       = string
        boot_order = number
      })
    )
  })
  default = {
    cpus        = 1
    description = "value"
    disks = [
      {
        name       = "rootdisk"
        size       = "10Gi"
        boot_order = 1
      },
      {
        name       = "emptydisk"
        size       = "40Gi"
        boot_order = 2
      }
    ]
    hostname  = "web.xnat.dev"
    memory    = "2Gi"
    name      = "web"
    namespace = "default"
    tags = {
      "vm" = "web"
    }
  }
}

variable "db_vm_data" {
  description = "parameters for db virtual machine"
  type = object({
    name        = string
    namespace   = string
    description = string
    hostname    = string
    tags        = map(string)
    cpus        = number
    memory      = string
    disks = list(
      object({
        name       = string
        size       = string
        boot_order = number
      })
    )
  })
  default = {
    cpus        = 1
    description = "value"
    disks = [
      {
        name       = "rootdisk"
        size       = "10Gi"
        boot_order = 1
      },
      {
        name       = "emptydisk"
        size       = "40Gi"
        boot_order = 2
      }
    ]
    hostname  = "db.xnat.dev"
    memory    = "2Gi"
    name      = "db"
    namespace = "default"
    tags = {
      "vm" = "db"
    }
  }
}
