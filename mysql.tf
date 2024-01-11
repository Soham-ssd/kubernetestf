resource "kubernetes_deployment" "example" {
  metadata {
    name = "mysql_container"
    labels = {
      test = "myapp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          test = "myapp"
        }
      }

      spec {
        container {
          image = "mysql:5.6"
          name  = "mysql"
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "unnati"
              }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 3306

            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
