resource "launchdarkly_project" "project" {
  for_each = {
    for project in var.project :
    project.name => project
  }
  key  = each.value.name
  name = lookup(each.value, "display_name", each.value.name)

  tags = var.tags

  dynamic "environments" {
    for_each = toset(
      concat(var.environment, lookup(each.value, "additional_environments", []))
    )

    content {
      name  = environments.value
      key   = lower(environments.value)
      color = "0a8b2f"
      tags  = var.tags
    }
  }
}
