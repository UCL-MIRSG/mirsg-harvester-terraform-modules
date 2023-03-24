output "node_port" {
  description = "The node port value assigned by Kubernetes."
  value       = kubernetes_service.nodeport.spec[0].port
}

output "cluster_ip" {
  description = "The node port value assigned by Kubernetes."
  value       = kubernetes_service.nodeport.spec[0].cluster_ip
}
