output "db_vm_ip_address" {
    value = harvester_virtualmachine.db.network_interface[0].ip_address
}

output "web_vm_ip_address" {
    value = harvester_virtualmachine.web.network_interface[0].ip_address
}
