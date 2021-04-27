data "azuread_group" "developers" {
  for_each = {
    for project in var.project :
    project.name => project
  }

  display_name = each.value.azuread_group
}

resource "launchdarkly_custom_role" "roles" {
  for_each = {
    for project in var.project :
    project.name => project
  }

  name        = each.value.name
  key         = data.azuread_group.developers[each.value.name].object_id
  description = "Allows development access to users in the AzureAD group ${each.value.azuread_group} for the ${each.value.name} project"

  policy_statements {
    effect    = "allow"
    resources = ["proj/${each.value.name}"]
    actions   = ["*"]
  }

  policy_statements {
    effect    = "allow"
    resources = ["proj/${each.value.name}"]
    actions   = ["*"]
  }

  policy_statements {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*"]
    actions   = ["*"]
  }

  policy_statements {
    effect    = "deny"
    resources = ["proj/${each.value.name}:env/*"]
    actions   = ["createEnvironment", "deleteEnvironment"]
  }

  policy_statements {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*:flag/*"]
    actions   = ["*"]
  }

  policy_statements {
    effect    = "allow"
    resources = ["proj/${each.value.name}:env/*:segment/*"]
    actions   = ["*"]
  }
}
