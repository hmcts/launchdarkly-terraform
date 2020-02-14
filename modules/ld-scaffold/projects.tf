resource "launchdarkly_project" "project" {
  for_each = {
    for project in var.project_names: 
    project.name => project 
  }
  key  = "${each.value.name}-project"
  name = each.value.name

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


