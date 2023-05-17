terraform {
  required_version = ">= 0.13"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}

resource "kubernetes_service" "clusterip" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = var.vm_name
    }
    port {
      name        = var.clusterip_name
      port        = var.port
      target_port = var.target_port
    }

    type = "ClusterIP"
  }
}
