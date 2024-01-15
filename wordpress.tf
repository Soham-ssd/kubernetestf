resource "kubernetes_deployment" "wordpress" {
  depends_on = [kubernetes_service.mysql_service]

  metadata {
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    name      = "wordpress-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "wordpress:latest"
          name  = "wordpress-container"

          env {
            name  = "WORDPRESS_DB_HOST"
            value = kubernetes_service.mysql_service.spec[0].cluster_ip
          }

          env {
            name  = "WORDPRESS_DB_USER"
            value = "root"
          }

          env {
            name  = "WORDPRESS_DB_PASSWORD"
            value = "unnati"
          }

          env {
            name  = "WORDPRESS_DB_NAME"
            value = "wordpressdb"
          }
        }
      }
    }
  }
}
