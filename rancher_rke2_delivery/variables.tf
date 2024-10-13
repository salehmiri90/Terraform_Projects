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

variable "rancher_ssl" {
  type = bool
  description = "if you are using self sign certificate, set to true"
}

variable "project_description" {
  type        = string
  description = "Description of the project"
}

variable "rancher_cluster_id" {
  type        = string
  description = "your rancher cluster id found it in rancher project web url"
}

variable "project_quota_cpu" {
  type        = string
  description = "the total project's cpu amount"
}

variable "project_quota_mem" {
  type        = string
  description = "the total project's memory amount"
}

variable "namespace_quota_cpu" {
  type        = string
  description = "the total namespace's cpu amount"
}

variable "namespace_quota_mem" {
  type        = string
  description = "the total namespace's memory amount"
}

variable "namespace_names" {
  type        = list(string)
  description = "List of namespace names"
}

#######################################
### Section for GitLab Info ###
variable "gitlab_url" {
  type        = string
  description = "URL to access gitlab web page"
}

variable "gitlab_token" {
  type        = string
  description = "token key to access gitlab server"
}

variable "gitlab_ssl" {
  type = bool
  description = "if you are using self sign certificate, set to true"
}

variable "gitlab_group_path" {
  type = string
  description = "the path of gitlab group, usually set same as group name"
}

variable "gitlab_group_descpn" {
  type = string
  description = "description to set on the gitlab group"
}

variable "gitlab_project_descpn" {
  type = string
  description = "description to set on the gitlab project"
}

variable "gitlab_visibility" {
  type = string
  description = "choose if your project is public or private"
}

variable "gitlab_members" {
  type = list(string)
  description = "List of GitLab usernames to add as members"
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

variable "ssh_host_port" {
  description = "nexus host port for connecting"
  type        = number
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

