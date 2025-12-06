variable "tenant_name" {
  type = string
}

variable "domain" {
  type = string
}

variable "namespace_labels" {
  type    = map(string)
  default = {}
}
