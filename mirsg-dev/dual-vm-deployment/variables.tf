variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "./mirsg_dev_kubeconfig.yml"
}

variable "USER_NAME" {
  description = "OS user to create"
  type = string
}

variable "USER_PASSWORD_HASH" {
  description = "OS user password hash"
  type = string
}

variable "USER_PUBLIC_KEY_PATH" {
  description = "path to public for OS user"
  type = string
}

variable "USER_PRIVATE_KEY_PATH" {
  description = "path to private key for OS user"
  type = string
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
    display_name = "centos-7-x86_64-genericcloud.qcow2"
    description  = ""
    source_type  = "download"
    url          = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
    tags         = { "format" = "qcow2" }
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
    pg_port = number
    pg_target_port = number
    ssh_node_port = number
    ssh_port = number
    ssh_target_port = number
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
    hostname  = "dev-xnat-db"
    memory    = "8Gi"
    name      = "dev-xnat-db"
    namespace = "default"
    pg_port = 5432
    pg_target_port = 5432
    ssh_node_port = 30204
    ssh_port = 22
    ssh_target_port = 22
    tags = {
      "vm" = "db"
    }
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
    http_node_port = number
    http_port = number
    http_target_port = number
    https_node_port = number
    https_port = number
    https_target_port = number
    ssh_node_port = number
    ssh_port = number
    ssh_target_port = number
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
    hostname  = "dev-xnat-web"
    memory    = "8Gi"
    name      = "dev-xnat-web"
    namespace = "default"
    tags = {
      "vm" = "web"
    }
    http_node_port = 30202
    http_port = 80
    http_target_port = 80
    https_node_port = 30203
    https_port = 443
    https_target_port = 443
    ssh_node_port = 30201
    ssh_port = 22
    ssh_target_port = 22
  }
}
