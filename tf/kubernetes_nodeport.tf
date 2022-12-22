resource "kubernetes_service" "web_ssh" {
  metadata {
    name = "web-vm-ssh-port"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.web.name
    }
    port {
      node_port   = 30201
      port        = 22
      target_port = 22
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "db_ssh" {
  metadata {
    name = "db-vm-ssh-port"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.db.name
    }
    port {
      node_port   = 30202
      port        = 22
      target_port = 22
    }

    type = "NodePort"
  }
}
