terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  # uses default kubeconfig (~/.kube/config)
}

module "tenant1" {
  source      = "../../modules/tenant"
  tenant_name = "tenant1"
  domain      = "example.local"
}

module "tenant2" {
  source      = "../../modules/tenant"
  tenant_name = "tenant2"
  domain      = "example.local"
}
