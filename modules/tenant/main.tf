resource "kubernetes_namespace" "tenant_ns" {
  metadata {
    name = var.tenant_name
    labels = var.namespace_labels
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name      = "${var.tenant_name}-app"
    namespace = kubernetes_namespace.tenant_ns.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "${var.tenant_name}-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.tenant_name}-app"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:stable"
          port { container_port = 80 }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name      = "${var.tenant_name}-svc"
    namespace = kubernetes_namespace.tenant_ns.metadata[0].name
  }

  spec {
    selector = {
      app = "${var.tenant_name}-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}


resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "${var.tenant_name}-ingress"
    namespace = kubernetes_namespace.tenant_ns.metadata[0].name

    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "false"
    }
  }

  spec {
    rule {
      host = "${var.tenant_name}.${var.domain}"

      http {
        path {
          path = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "${var.tenant_name}-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}


