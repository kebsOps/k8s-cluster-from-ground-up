terraform {
  cloud {
    organization = "k8s-cluster-from-ground-up"

    workspaces {
      name = "k8s-cluster-from-ground-up"
    }
  }
}