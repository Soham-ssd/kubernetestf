resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "my-app-namespace"
  }
}
