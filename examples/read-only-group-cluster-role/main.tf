terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.0"
    }
  }
  required_version = "~> 0.14.0"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Create a read-only ClusterRole
module "read_only_cluster_role" {
  source    = "../../"
  name      = "read-only-cluster-role"
  rules = [{
    api_groups = [""]
    verbs      = ["get", "list", "watch"]
    resources  = ["*"]
    }, {
    api_groups = ["extensions"]
    verbs      = ["get", "list", "watch"]
    resources  = ["*"]
    }, {
    api_groups = ["apps"]
    verbs      = ["get", "list", "watch"]
    resources  = ["*"]
    }
  ]
  subjects = [{
    kind = "Group"
    name = "Readers"
  }]
}
