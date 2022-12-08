#### Table of Contents

1. [Usage](#usage)
2. [Requirements](#requirements)
3. [Providers](#Providers)
4. [Inputs](#inputs)
5. [Outputs](#outputs)

## Usage

\*various commands

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_image.os_image](https://registry.terraform.io/providers/harvester/harvester/0.4.0/docs/resources/image) | resource |
| [harvester_virtualmachine.db](https://registry.terraform.io/providers/harvester/harvester/0.4.0/docs/resources/virtualmachine) | resource |
| [harvester_virtualmachine.web](https://registry.terraform.io/providers/harvester/harvester/0.4.0/docs/resources/virtualmachine) | resource |
| [harvester_network.vm_network](https://registry.terraform.io/providers/harvester/harvester/0.4.0/docs/data-sources/network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_vm_data"></a> [db\_vm\_data](#input\_db\_vm\_data) | parameters for db virtual machine | <pre>object({<br>    name        = string<br>    namespace   = string<br>    description = string<br>    hostname    = string<br>    tags        = map(string)<br>    cpus        = number<br>    memory      = string<br>    disks = list(<br>      object({<br>        name       = string<br>        size       = string<br>        boot_order = number<br>      })<br>    )<br>  })</pre> | <pre>{<br>  "cpus": 1,<br>  "description": "value",<br>  "disks": [<br>    {<br>      "boot_order": 1,<br>      "name": "rootdisk",<br>      "size": "10Gi"<br>    },<br>    {<br>      "boot_order": 2,<br>      "name": "emptydisk",<br>      "size": "40Gi"<br>    }<br>  ],<br>  "hostname": "db.xnat.dev",<br>  "memory": "2Gi",<br>  "name": "db",<br>  "namespace": "default",<br>  "tags": {<br>    "vm": "db"<br>  }<br>}</pre> | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | Path to kubeconfig file | `string` | `""` | no |
| <a name="input_os_image"></a> [os\_image](#input\_os\_image) | OS image for virtual machines | <pre>object({<br>    name         = string<br>    namespace    = string<br>    display_name = string<br>    description  = string<br>    source_type  = string<br>    url          = string<br>    tags         = map(string)<br>  })</pre> | <pre>{<br>  "description": "",<br>  "display_name": "centos7",<br>  "name": "centos7",<br>  "namespace": "default",<br>  "source_type": "download",<br>  "tags": {<br>    "format": "qcow2"<br>  },<br>  "url": "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"<br>}</pre> | no |
| <a name="input_vm_network"></a> [vm\_network](#input\_vm\_network) | network for virtual machines | <pre>object({<br>    vlanid    = string<br>    namespace = string<br>  })</pre> | <pre>{<br>  "namespace": "default",<br>  "vlanid": ""<br>}</pre> | no |
| <a name="input_web_vm_data"></a> [web\_vm\_data](#input\_web\_vm\_data) | parameters for web virtual machine | <pre>object({<br>    name        = string<br>    namespace   = string<br>    description = string<br>    hostname    = string<br>    tags        = map(string)<br>    cpus        = number<br>    memory      = string<br>    disks = list(<br>      object({<br>        name       = string<br>        size       = string<br>        boot_order = number<br>      })<br>    )<br>  })</pre> | <pre>{<br>  "cpus": 1,<br>  "description": "value",<br>  "disks": [<br>    {<br>      "boot_order": 1,<br>      "name": "rootdisk",<br>      "size": "10Gi"<br>    },<br>    {<br>      "boot_order": 2,<br>      "name": "emptydisk",<br>      "size": "40Gi"<br>    }<br>  ],<br>  "hostname": "web.xnat.dev",<br>  "memory": "2Gi",<br>  "name": "web",<br>  "namespace": "default",<br>  "tags": {<br>    "vm": "web"<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
