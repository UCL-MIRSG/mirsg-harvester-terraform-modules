variable "user" {
  description = "OS user to create"
  type = string
}

variable "password_hash" {
  description = "OS user password hash"
  type = string
}

variable "public_key" {
  description = "Public key for OS user"
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
}

variable "vm_data" {
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
}
