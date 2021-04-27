data "azurerm_key_vault_secret" "launchdarkly-access" {
  name         = "launchdarkly-access-token"
  key_vault_id = data.azurerm_key_vault.launchdarkly.id
}

data "azurerm_key_vault" "launchdarkly" {
  name                = "cftptl-intsvc"
  resource_group_name = "core-infra-intsvc-rg"
}

module "launchdarkly" {
  source = "./modules/ld-scaffold"

  project     = var.projects
  environment = var.environments
  tags        = var.tags
}
