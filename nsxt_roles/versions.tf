terraform {
  required_version = ">= 0.13"
  required_providers {
    nsxt = {
      source  = "registry.terraform.io/vmware/nsxt"
      version = "3.3.0"
    }
  }
}
