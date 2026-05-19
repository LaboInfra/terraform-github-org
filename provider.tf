terraform {

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "remote" {
    hostname     = "otf.gablan.fr"
    organization = "laboinfra"

    workspaces {
      name = "github-org"
    }
  }
}

provider "github" {
  owner = "laboinfra"
}
