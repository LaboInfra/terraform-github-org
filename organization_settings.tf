resource "github_organization_settings" "org_settings" {
  billing_email                           = "contact@laboinfra.net"
  blog                                    = "https://docs.laboinfra.net"
  email                                   = "contact@laboinfra.net"
  location                                = "Paris, France"
  description                             = "What are we doing here ?"
  default_repository_permission           = "read"
  members_can_create_repositories         = false
  members_can_create_private_repositories = false
  members_can_create_public_repositories  = false
}