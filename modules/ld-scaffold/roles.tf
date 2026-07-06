locals {
  projects_by_name = {
    for project in var.project :
    project.name => project
  }

  # A project supplying admin_azuread_group is split into an elevated <name>_admin role
  # plus a restricted <name>_member role (keyed on its existing azuread_group). Any other
  # project keeps its single full-access role unchanged.
  split_projects  = { for name, p in local.projects_by_name : name => p if lookup(p, "admin_azuread_group", null) != null }
  legacy_projects = { for name, p in local.projects_by_name : name => p if lookup(p, "admin_azuread_group", null) == null }

  full_access = [
    { effect = "allow", suffixes = [""], actions = ["*"] },
    { effect = "allow", suffixes = [":env/*"], actions = ["*"] },
    { effect = "deny", suffixes = [":env/*"], actions = ["createEnvironment", "deleteEnvironment"] },
    { effect = "allow", suffixes = [":env/*:flag/*"], actions = ["*"] },
    { effect = "allow", suffixes = [":env/*:segment/*"], actions = ["*"] },
  ]

  member_denied_flag_actions = [
    "updateOn", "updateFallthrough", "updateOffVariation", "updateFlagVariations",
    "updateFlagDefaultVariations", "updateTargets", "updateExpiringTargets", "updateRules",
    "updatePrerequisites", "updateScheduledChanges", "deleteFlag",
  ]
}

data "azuread_group" "developers" {
  for_each = local.projects_by_name

  display_name = each.value.azuread_group
}

data "azuread_group" "admin" {
  for_each = local.split_projects

  display_name = each.value.admin_azuread_group
}

resource "launchdarkly_custom_role" "roles" {
  for_each = local.legacy_projects

  name        = each.value.name
  key         = data.azuread_group.developers[each.key].object_id
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

resource "launchdarkly_custom_role" "admin" {
  for_each = local.split_projects

  name        = "${each.value.name}_admin"
  key         = data.azuread_group.admin[each.key].object_id
  description = "Full administrator access to the ${each.value.name} project for the AzureAD group ${each.value.admin_azuread_group}"

  dynamic "policy_statements" {
    for_each = local.full_access
    content {
      effect    = policy_statements.value.effect
      resources = [for s in policy_statements.value.suffixes : "proj/${each.value.name}${s}"]
      actions   = policy_statements.value.actions
    }
  }
}

# Migrate the pre-split single opal role into opal_member in place
moved {
  from = launchdarkly_custom_role.roles["opal"]
  to   = launchdarkly_custom_role.member["opal"]
}

resource "launchdarkly_custom_role" "member" {
  for_each = local.split_projects

  name        = "${each.value.name}_member"
  key         = data.azuread_group.developers[each.key].object_id
  description = "Restricted access to the ${each.value.name} project for the AzureAD group ${each.value.azuread_group}: full non-prod access, read-only on production flags"

  dynamic "policy_statements" {
    for_each = concat(local.full_access, [{
      effect   = "deny"
      suffixes = [for env in lookup(each.value, "member_protected_environments", ["production"]) : ":env/${env}:flag/*"]
      actions  = local.member_denied_flag_actions
    }])
    content {
      effect    = policy_statements.value.effect
      resources = [for s in policy_statements.value.suffixes : "proj/${each.value.name}${s}"]
      actions   = policy_statements.value.actions
    }
  }
}
