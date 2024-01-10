resource "kubernetes_env" "example" {
  container = "mysql"
  metadata {
    name = "mysql-deployment"
  }

  api_version = "apps/v1"
  kind        = "Deployment"

  env {
    name  = "MYSQL_ROOT_PASSWORD"
    value = "unnati"
  }

}
