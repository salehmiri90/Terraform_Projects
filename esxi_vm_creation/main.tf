#  ESXI Provider host/login details
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "vmsalehmiri01" {
  guest_name = "vmsalehmiri01"
  disk_store = "DS_001"
  network_interfaces {
    virtual_network = "VM Network"
  }
}

