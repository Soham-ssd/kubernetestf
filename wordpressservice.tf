resource "kubernetes_service" "wordpress_service" {
  depends_on = [kubernetes_deployment.wordpress]

  metadata {
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    name      = "wordpress-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.wordpress.spec[0].selector[0].match_labels.app
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 80
      node_port   = 31010
    }
  }
}
