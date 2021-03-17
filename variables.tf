variable "tenant_id" {
  default = "42c385ba-d3a9-4aed-b4b5-34a0d112bb1b"
}

variable "subscription_id" {
  default = "32c77019-3cb7-443a-9efe-4d95702c0620"
}

variable "client_id" {
  default = "87369f23-3df8-47dd-ab74-9b3286b5bb04"
}

variable "client_secret" {
  description = "enter terraform service principal secret key"
}

variable "location" {
  type = string
}

