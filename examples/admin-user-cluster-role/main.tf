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

# Create an admin ClusterRole
module "admin_cluster_role" {
  source    = "../../"
  name      = "admin-cluster-role"
  rules = [{
    api_groups = ["*"]
    verbs      = ["*"]
    resources  = ["*"]
  }]
  subjects = [{
    kind = "User"
    name = "Admin"
  }]
}
