# Example of creating a new OS image
# resource "harvester_image" "os_image" {
#   name         = var.os_image.name
#   namespace    = var.os_image.namespace
#   display_name = var.os_image.display_name
#   source_type  = var.os_image.source_type
#   url          = var.os_image.url
# }

data "harvester_image" "os_image" {
  display_name = var.os_image.display_name
  namespace    = var.os_image.namespace
}
