###################################
### General Section ####
variable "project_name" {
  type        = string
  description = "Name of the project"
}


#####################################
### Section for Rancher infor ###
variable "rancher_api_url" {
  type        = string
  description = "Rancher API URL"
}

variable "rancher_token_key" {
  type        = string
  description = "Rancher Access Token Key"
}

variable "project_description" {
  type        = string
  description = "Description of the project"
}

variable "namespace_names" {
  type        = list(string)
  description = "List of namespace names"
}


#######################################
### Section for free port and Nexus ###
variable "start_port" {
  description = "Starting port number for the range"
  type        = number
}

variable "end_port" {
  description = "Ending port number for the range"
  type        = number
}

variable "ssh_host" {
  description = "nexus host ip or name for connecting"
  type        = string
}

variable "remote_user" {
  description = "The user to connect to the remote server"
  type        = string
}

variable "remote_pass" {
  description = "nexus server password for SSH authentication"
  type        = string
}

variable "nexus_user" {
  description = "The user to connect to the nexus server web GUI"
  type        = string
}

variable "nexus_pass" {
  description = "nexus server password for web GUI"
  type        = string
}

