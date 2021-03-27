# Name of the ClusterRole object
output "cluster_role_name" {
  value = var.name
}

# Name of the ClusterRoleBinding object
output "cluster_role_binding_name" {
  value = "${var.name}-binding"
}
