provider "kubernetes" {
  config_context_cluster   = "demo-k8s-jpalma-demo-df4affmgmt"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-demo"
  }
}
