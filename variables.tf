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

variable "subjects" {
  description = "The ClusterRoleBinding's subject, which should include lists of `kind` and `name`"
  type = list(object({
    kind = string
    name = string
  }))
}

variable "create" {
  description = "Should the ClusterRole and ClusterRoleBinding objects be created?"
  type        = bool
  default     = true
}
