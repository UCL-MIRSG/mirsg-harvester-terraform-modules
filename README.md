# Terraform modules for deploying infrastructure on Harvester.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.4.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.16.1 |

## Modules

- [kubernetes-clusterip](./modules/kubernetes-clusterip/README.md)
- [kubernetes-nodeport](./modules/kubernetes-nodeport/README.md)
- [virtual-machine](./modules/virtual-machine/README.md)
