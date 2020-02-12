resource "launchdarkly_project" "project" {
  for_each = toset(var.project_names)
  key  = "${each.value}-project"
  name = each.value

  tags = [
    "terraform",
  ]

  dynamic "environments" {
    for_each = [for env in var.environment_names: {
      name = env.name
      key = env.key
      color = env.color
      tags = env.tags
    }]
    content {
        name = environments.value.name
        key = environments.value.key
        color = environments.value.color
        tags = environments.value.tags
    }
  }
}