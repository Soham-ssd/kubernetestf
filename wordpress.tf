resource "kubernetes_deployment" "example1" {
  metadata {
    name = "wordpress-container"
    labels = {
      test = "myapp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "myapp1"
      }
    }

    template {
      metadata {
        labels = {
          test = "myapp1"
        }
      }

      spec {
        container {
          image = "wordpress:latest"
          name  = "wordpress"

          env {
            name  = "DB_HOST"
            value = "mysql"
              }
          env {
            name  = "DB_USER"
            value = "root"
              }
          env {
            name  = "DB_PASSWORD"
            value = "unnati"
              }
          env {
            name  = "DB_NAME"
            value = "wp"
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
              port = 80

            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
