resource "kubernetes_service" "web_ssh" {
  metadata {
    name = "${harvester_virtualmachine.web.name}-ssh"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.web.name
    }
    port {
      name = "${harvester_virtualmachine.web.name}-ssh-port"
      node_port   = 30201
      port        = 22
      target_port = 22
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "web_multi_port" {
  metadata {
    name = "${harvester_virtualmachine.web.name}"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.web.name
    }
    port {
      name = "${harvester_virtualmachine.web.name}-http-port"
      node_port   = 30202
      port        = 80
      target_port = 80
    }

    port {
      name = "${harvester_virtualmachine.web.name}-https-port"
      node_port   = 30203
      port        = 443
      target_port = 443
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "db_ssh" {
  metadata {
    name = "${harvester_virtualmachine.db.name}-ssh"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.db.name
    }
    port {
      name = "${harvester_virtualmachine.db.name}-ssh-port"
      node_port   = 30204
      port        = 22
      target_port = 22
    }

    type = "NodePort"
  }
}
resource "kubernetes_service" "db_pg_port" {
  metadata {
    name = "${harvester_virtualmachine.db.name}-pg"
  }
  spec {
    selector = {
      "harvesterhci.io/vmName" = harvester_virtualmachine.db.name
    }
   port {
      name = "${harvester_virtualmachine.web.name}-pg-port"
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}
