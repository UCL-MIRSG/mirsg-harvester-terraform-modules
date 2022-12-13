data "harvester_network" "vm_network" {
  name      = var.vm_network.vlanid
  namespace = var.vm_network.namespace
}
