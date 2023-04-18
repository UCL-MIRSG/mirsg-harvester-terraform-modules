output "service_name" {
  description = "The node port value assigned by Kubernetes."
  value       = kubernetes_service.clusterip.metadata.name
}
