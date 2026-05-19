resource "github_repository" "repositories" {
  for_each = local.repositories

  name        = each.key
  description = try(each.value.description, null)
  visibility  = try(each.value.visibility, null)
}

resource "github_branch_default" "default" {
  for_each = local.repositories

  repository = github_repository.repositories[each.key].name
  branch     = "main"
  rename     = true
}

resource "github_branch_protection" "default" {
  for_each = {
    for repository_name, repository_settings in local.repositories : repository_name => repository_settings
    if try(repository_settings.branch_protection_enabled, true)
  }

  repository_id  = github_repository.repositories[each.key].name
  pattern        = "main"
  enforce_admins = false

  depends_on = [github_branch_default.default]
}

resource "github_repository_collaborator" "collaborators" {
  for_each = merge([
    for username, details in local.members : {
      for repository, repository_details in try(details.repositories, {}) : "${username}-${repository}" => {
        username   = username
        repository = repository
        permission = repository_details.permission
      }
    }
  ]...)

  repository = github_repository.repositories[each.value.repository].name
  username   = github_membership.memberships[each.value.username].username
  permission = each.value.permission
}
