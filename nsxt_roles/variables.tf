variable "nsxt_host" {
  type        = string
  description = "NSXT host IP address"
}

variable "nsxt_username" {
  type        = string
  description = "NSXT username"
}

variable "nsxt_password" {
  type        = string
  description = "NSXT password"
}

variable "nsxt_allow_unverified_ssl" {
  type        = bool
  description = "Allow unverified SSL certificate for NSXT provider"
  default     = true
}

variable "nsxt_max_retries" {
  type        = number
  description = "Maximum number of retries for NSXT provider"
  default     = 2
}

variable "policy_group_display_name" {
  type        = string
  description = "Display name for the NSXT policy group"
}

variable "policy_group_ip_addresses" {
  type        = list(string)
  description = "IP addresses for the NSXT policy group"
}
