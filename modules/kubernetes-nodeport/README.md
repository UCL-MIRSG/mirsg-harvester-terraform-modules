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
| [kubernetes_service.nodeport](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ports"></a> [ports](#input\_ports) | The ports inline block | `map(any)` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of service. | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The VM name which will be the endpoint for this service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ip"></a> [cluster\_ip](#output\_cluster\_ip) | The node port value assigned by Kubernetes. |
| <a name="output_node_port"></a> [node\_port](#output\_node\_port) | The node port value assigned by Kubernetes. |
<!-- END_TF_DOCS -->
