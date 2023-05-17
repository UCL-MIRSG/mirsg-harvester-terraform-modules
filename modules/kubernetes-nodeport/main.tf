terraform {
  required_version = ">= 0.13"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
}

resource "kubernetes_service" "nodeport" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = var.vm_name
    }

    dynamic "port" {
      for_each = var.ports

      content {
        name        = port.key
        port        = port.value.port
        target_port = port.value.target_port
      }
    }

    type = "NodePort"
  }
}
