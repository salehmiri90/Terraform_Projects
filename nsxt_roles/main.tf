provider "nsxt" {
  host                 = var.nsxt_host
  username             = var.nsxt_username
  password             = var.nsxt_password
  allow_unverified_ssl = var.nsxt_allow_unverified_ssl
  max_retries          = var.nsxt_max_retries
}

resource "nsxt_policy_group" "NSXT-AD-List-GP" {
  display_name = var.policy_group_display_name

  criteria {
    ipaddress_expression {
      ip_addresses = var.policy_group_ip_addresses
    }
  }
}
