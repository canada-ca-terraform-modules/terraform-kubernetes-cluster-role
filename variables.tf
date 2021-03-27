variable "name" {
  description = "Name of the Kubernetes ClusterRole to create"
  type        = string
}

variable "rules" {
  description = "The ClusterRole's rule, which should include lists of `api_groups`, `verbs` and `resources`"
  type = list(object({
    api_groups = list(string)
    verbs      = list(string)
    resources  = list(string)
  }))
}

# TODO: update namespace to optional() object type attribute with Terraform v0.15 release
variable "subjects" {
  description = "The cluster role binding's subject.  To use the `default` namespace for a kind of `User` or `Group`, pass a `null` namespace."
  type = list(object({
    kind      = string
    name      = string
    namespace = string
  }))
}

variable "create" {
  description = "Should the ClusterRole and ClusterRoleBinding objects be created?"
  type        = bool
  default     = true
}
