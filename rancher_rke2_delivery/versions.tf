terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
    nexus = {
      source = "datadrivers/nexus"
    }
    template = {
      source = "hashicorp/template"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

