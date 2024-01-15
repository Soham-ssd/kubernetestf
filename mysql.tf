resource "kubernetes_deployment" "mysql" {
  metadata {
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    name      = "mysql-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = "mysql:5.6"
          name  = "mysql-container"

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "unnati"
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "wordpressdb"
          }
          }
        }
      }
    }
  }
