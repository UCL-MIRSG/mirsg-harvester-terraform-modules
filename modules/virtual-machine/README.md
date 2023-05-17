<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_virtualmachine.vm](https://registry.terraform.io/providers/harvester/harvester/0.6.0/docs/resources/virtualmachine) | resource |
| [harvester_image.os_image](https://registry.terraform.io/providers/harvester/harvester/0.6.0/docs/data-sources/image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_os_image"></a> [os\_image](#input\_os\_image) | OS image for virtual machines | <pre>object({<br>    name         = string<br>    namespace    = string<br>    display_name = string<br>    description  = string<br>    source_type  = string<br>    url          = string<br>    tags         = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | cloud-init user\_data | `string` | n/a | yes |
| <a name="input_vm_data"></a> [vm\_data](#input\_vm\_data) | parameters for web virtual machine | <pre>object({<br>    name        = string<br>    namespace   = string<br>    description = string<br>    hostname    = string<br>    tags        = map(string)<br>    cpus        = number<br>    memory      = string<br>    disks = map(<br>      object({<br>        name       = string<br>        size       = string<br>        boot_order = number<br>      })<br>    )<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ip_address"></a> [vm\_ip\_address](#output\_vm\_ip\_address) | n/a |
<!-- END_TF_DOCS -->
