resource "launchdarkly_project" "project" {
  for_each = toset(var.project_names)
  key  = "${each.value}-project"
  name = each.value

  tags = var.tags

  dynamic "environments" {
    for_each = toset(var.environment_names)
    content {
        name = environments.value
        key = lower(environments.value)
        color = var.env_color
        tags = var.tags
    }
  }
}

resource "launchdarkly_custom_role" "roles" {
  for_each = toset(var.project_names)
  key = "${each.value}-role-key"
  name = "${each.value}-role"
  description = "Allow full access to ${each.value} project."

  policy {
    effect    = "allow"
    resources = ["proj/${each.value}"]
    actions   = ["*"]
  }
}