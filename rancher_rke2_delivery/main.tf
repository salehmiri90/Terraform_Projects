#####################################
### Section for managing Rancher2 ###
provider "rancher2" {
  api_url   = var.rancher_api_url
  token_key = var.rancher_token_key
  insecure  = var.rancher_ssl
}

resource "rancher2_project" "project" {
  name        = var.project_name
  description = var.project_description
  cluster_id  = var.rancher_cluster_id

  resource_quota {
    project_limit {
      limits_cpu    = var.project_quota_cpu
      limits_memory = var.project_quota_mem
    }
    namespace_default_limit {
      limits_cpu    = var.namespace_quota_cpu
      limits_memory = var.namespace_quota_mem
    }
  }
}

resource "rancher2_namespace" "namespaces" {
  for_each    = toset(var.namespace_names)
  project_id  = rancher2_project.project.id
  name        = each.value
  description = "${each.value} namespace for ${var.project_name} project"
}

resource "rancher2_namespace" "namespaces" {
  for_each    = toset(var.namespace_names)
  project_id  = rancher2_project.project.id
  name        = each.value
  description = "${each.value} namespace for ${var.project_name} project"
}
##########################
### Section for Gitlab ###

provider "gitlab" {
  base_url = var.gitlab_url
  token    = var.gitlab_token
  insecure = var.gitlab_ssl
}

resource "gitlab_group" "group" {
  name        = var.project_name
  path        = var.gitlab_group_path
  description = var.gitlab_group_descpn
}

resource "gitlab_project" "project" {
  name             = var.project_name
  namespace_id     = gitlab_group.group.id
  description      = var.gitlab_project_descpn
  visibility_level = var.gitlab_visibility
}

output "group_id" {
  value       = gitlab_group.group.id
  description = "ID of the created group"
}

data "gitlab_user" "user" {
  for_each = toset(var.gitlab_members)
  username = each.key
}

resource "gitlab_group_membership" "member" {
  for_each     = data.gitlab_user.users
  group_id     = gitlab_group.group.id
  user_id      = each.value.id
  access_level = "maintainer"
  expires_at   = null
}

##################################
### Section for find free port ###
provider "null" {}

module "port_checker" {
  source     = "./modules/port_checker"
  start_port = var.start_port
  end_port   = var.end_port
  ssh_host   = var.ssh_host
}

data "local_file" "available_port" {
  filename   = "./modules/port_checker/available_port.txt"
  depends_on = [module.port_checker]
}

output "available_port" {
  value = data.local_file.available_port.content
}

###################################
### Section for Accessing Nexus ###
provider "nexus" {
  url      = "http://${var.ssh_host}:${var.ssh_host_port}"
  username = var.nexus_user
  password = var.nexus_pass
}

module "nexus_repository" {
  source      = "./modules/nexus_repository"
  projectname = var.project_name
  http_port   = tonumber(trimspace(data.local_file.available_port.content))
  depends_on  = [module.port_checker]
}

module "nginx_template" {
  source      = "./modules/nginx_template"
  projectname = var.project_name
  listen_port = tonumber(trimspace(data.local_file.available_port.content) + 1000)
  proxy_port  = tonumber(trimspace(data.local_file.available_port.content))
  server_name = var.ssh_host
  depends_on  = [module.nexus_repository]
}

module "upload_nginx_config" {
  source      = "./modules/upload_nginx_config"
  sourcefile  = "/tmp/${var.project_name}.conf"
  destination = "/etc/nginx/conf.d/${var.project_name}.conf"
  projectname = var.project_name
  ssh_host    = var.ssh_host
  remote_user = var.remote_user
  remote_pass = var.remote_pass
  depends_on  = [module.nginx_template]
}

##################################
