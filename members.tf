resource "github_membership" "memberships" {
  for_each = local.members

  username = each.key
  role     = each.value.role
}
