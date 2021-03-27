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

# A ClusterRole that does not get created because `create=false`
module "no_create_cluster_role" {
  source = "../../"
  name   = "no-create-cluster-role"
  create = false
  rules = [{
    api_groups = ["*"]
    verbs      = ["*"]
    resources  = ["*"]
  }]
  subjects = [{
    kind      = "User"
    name      = "Admin"
    namespace = null
  }]
}
