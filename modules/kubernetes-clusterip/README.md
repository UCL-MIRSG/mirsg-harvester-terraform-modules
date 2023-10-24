<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_service.clusterip](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clusterip_name"></a> [clusterip\_name](#input\_clusterip\_name) | The name of cluster ip port. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | The port number being opened. | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of service. | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | The port number being targeted. | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The VM name which will be the endpoint for this service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The node port value assigned by Kubernetes. |
<!-- END_TF_DOCS -->
