resource "kubernetes_cluster_role" "cluster-role" {
  count = var.create ? 1 : 0

  metadata {
    name      = var.name
  }

  dynamic "rule" {
    for_each = var.rules
    content {
      api_groups = rule.value["api_groups"]
      verbs      = rule.value["verbs"]
      resources  = rule.value["resources"]
    }
  }
}

resource "kubernetes_cluster_role_binding" "cluster-role-binding" {
  count = var.create ? 1 : 0

  metadata {
    name      = "${var.name}-binding"
  }

  role_ref {
    kind      = "ClusterRole"
    name      = var.name
    api_group = "rbac.authorization.k8s.io"
  }

  dynamic "subject" {
    for_each = var.subjects
    content {
      kind      = subject.value["kind"]
      name      = subject.value["name"]
      namespace = subject.value["namespace"] == null ? "default" : subject.value["namespace"]
      api_group = subject.value["kind"] == "ServiceAccount" ? "" : "rbac.authorization.k8s.io"
    }
  }
}
