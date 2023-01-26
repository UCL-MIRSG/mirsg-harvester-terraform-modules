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

# create database VM
module "db_virtual_machine" {
    source = "../../modules/virtual_machine"

    user = var.USER_NAME
    password_hash = var.USER_PASSWORD_HASH
    public_key_path = var.USER_PUBLIC_KEY_PATH
    private_key_path = var.USER_PRIVATE_KEY_PATH
    os_image = var.os_image
    vm_data = var.db_vm_data
}

# create web VM
module "web_virtual_machine" {
    source = "../../modules/virtual_machine"

    user = var.USER_NAME
    password_hash = var.USER_PASSWORD_HASH
    public_key_path = var.USER_PUBLIC_KEY_PATH
    private_key_path = var.USER_PRIVATE_KEY_PATH
    os_image = var.os_image
    vm_data = var.web_vm_data
}

# create ssh NodePort for db VM
module "db_ssh_node_port" {
    source = "../../modules/kubernetes-nodeport"

    vm_name = var.db_vm_data.name
    service_name = "${var.db_vm_data.name}-ssh"
    ports = {
        "${var.db_vm_data.name}-ssh-port" = {
            node_port = var.db_vm_data.ssh_node_port
            port = var.db_vm_data.ssh_port
            target_port = var.db_vm_data.ssh_target_port
        }
    }
}

# create ssh NodePort for web VM
module "web_ssh_node_port" {
    source = "../../modules/kubernetes-nodeport"

    vm_name = var.web_vm_data.name
    service_name = "${var.web_vm_data.name}-ssh"
    ports = {
        "${var.web_vm_data.name}-ssh-port" = {
            node_port = var.web_vm_data.ssh_node_port
            port = var.web_vm_data.ssh_port
            target_port = var.web_vm_data.ssh_target_port
        }
    }
}

# create http and https NodePort for web VM
module "web_http_https_node_port" {
    source = "../../modules/kubernetes-nodeport"

    vm_name = var.web_vm_data.name
    service_name = "${var.web_vm_data.name}-ssh"
    ports = {
        "${var.web_vm_data.name}-http-port" = {
            node_port = var.web_vm_data.http_node_port,
            port = var.web_vm_data.http_port,
            target_port = var.web_vm_data.http_target_port,
        },
        "${var.web_vm_data.name}-https-port" = {
            node_port = var.web_vm_data.https_node_port,
            port = var.web_vm_data.https_port,
            target_port = var.web_vm_data.https_target_port,
        }
    }
}

# create PG (5432) ClusterIP for db VM
module "db_pg_clusterip" {
    source = "../../modules/kubernetes-clusterip"

    vm_name = var.db_vm_data.name
    service_name = "${var.db_vm_data.name}-pg"
    name =  "${var.db_vm_data.name}-pg-port"
    port = var.db_vm_data.pg_port
    target_port = var.db_vm_data.pg_target_port
}
