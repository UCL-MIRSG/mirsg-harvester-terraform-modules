variable "vm_name" {
  description = "The VM name which will be the endpoint for this service."
  type        = string
}

variable "service_name" {
  description = "The name of service."
  type        = string
}

variable "ports" {
  description = "The ports inline block"
  type        = map(any)
}
