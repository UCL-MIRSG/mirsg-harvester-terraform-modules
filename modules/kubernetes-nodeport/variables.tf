variable "kubeconfig_path" {
  description = "The path to the kubeconfig file."
  type = string
}

variable "vm_name" {
  description = "The VM name which will be the endpoint for this service."
  type = string
}

variable "service_name" {
  description = "The name of service."
  type = string
}

variable "node_port_name" {
  description = "The name of service."
  type = string
}

variable "node_port" {
  description = "The NodePort value."
  type = string
}

variable "port" {
  description = "The port number being opened."
  type = string
}

variable "target_port" {
  description = "The port number being targeted."
  type = string
}
