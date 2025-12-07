module "tenant1" {
  source      = "../../modules/tenant"
  tenant_name = "tenant1"
  domain      = "example.local"
}

module "tenant2" {
  source      = "../../modules/tenant"
  tenant_name = "tenant2"
  domain      = "example.local"
}
