resource "launchdarkly_custom_role" "roles" {
  for_each = {
    for project in var.project :
    project.name => project
  }

  name        = each.value.name
  key         = each.value.azuread_group
  description = "Allows development access to users in the AzureAD group ${each.value.name} for the ${each.value.name} project"

  policy {
    effect    = "allow"
    resources = ["proj/${each.value.name}"]
    actions   = ["*"]
  }

  policy {
    effect    = "allow"
    resources = ["proj/${each.value.name}"]
    actions   = ["*"]
  }

  policy {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*"]
    actions   = ["*"]
  }

  policy {
    effect    = "Deny"
    resources = ["proj/${each.value.name}:env/*"]
    actions   = ["createEnvironment", "deleteEnvironment"]
  }

  policy {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*:flag/*"]
    actions   = ["*"]
  }

  policy {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*:segment/*"]
    actions   = ["*"]
  }
}