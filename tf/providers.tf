terraform {
  required_version = ">= 0.13"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.1"
    }
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.0"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "harvester" {
  kubeconfig = var.kubeconfig_path
}
