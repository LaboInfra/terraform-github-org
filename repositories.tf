resource "github_repository" "repositories" {
  for_each = local.repositories

  name         = each.key
  description  = try(each.value.description, null)
  visibility   = try(each.value.visibility, null)
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
