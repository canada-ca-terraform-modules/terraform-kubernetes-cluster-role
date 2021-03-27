# Name of the ClusterRole object
output "cluster_role_name" {
  value = module.read_only_cluster_role.cluster_role_name
}

# Name of the ClusterRoleBinding object
output "cluster_role_binding_name" {
  value = module.read_only_cluster_role.cluster_role_binding_name
}
