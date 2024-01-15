resource "kubernetes_service" "mysql_service" {
  depends_on = [kubernetes_deployment.mysql]

  metadata {
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    name      = "mysql-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.mysql.spec[0].selector[0].match_labels.app
    }

    port {
      port        = 3306
      target_port = 3306
    }
  }
}
