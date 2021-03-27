[![Build status](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-cluster-role/actions/workflows/terraform.yml/badge.svg)](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-cluster-role/actions/workflows/terraform.yml)

# Terraform Kubernetes ClusterRole
Creates Kubernetes ClusterRole and ClusterRoleBinding objects in a namespace.  Supports `User` and `Group` subjects for the RoleBinding.

# Requirements

No requirements.

# Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |

# Modules

No Modules.

# Resources

| Name |
|------|
| [kubernetes_cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) |
| [kubernetes_cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Should the ClusterRole and ClusterRoleBinding objects be created? | `bool` | `true` | no |
| name | Name of the Kubernetes ClusterRole to create | `string` | n/a | yes |
| rules | The ClusterRole's rule, which should include lists of `api_groups`, `verbs` and `resources` | <pre>list(object({<br>    api_groups = list(string)<br>    verbs      = list(string)<br>    resources  = list(string)<br>  }))</pre> | n/a | yes |
| subjects | The cluster role binding's subject.  To use the `default` namespace for a kind of `User` or `Group`, pass a `null` namespace. | <pre>list(object({<br>    kind      = string<br>    name      = string<br>    namespace = string<br>  }))</pre> | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| cluster\_role\_binding\_name | Name of the ClusterRoleBinding object |
| cluster\_role\_name | Name of the ClusterRole object |

# Local testing
You can use k3d in the devcontainer to run a small test cluster with the examples:
```sh
make cluster_create_dev
make test
```
