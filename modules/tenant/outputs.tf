output "namespace" {
  value = kubernetes_namespace.tenant_ns.metadata[0].name
}

output "ingress_host" {
  value = "${var.tenant_name}.${var.domain}"
}
