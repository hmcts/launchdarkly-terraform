data "azurerm_key_vault" "launchdarkly" {
    name = "cftptl-intsvc"
    resource_group_name = "core-infra-intsvc-rg"
}

data "azurerm_key_vault_secret" "launchdarkly_kv_secret" {
    name = "launchdarkly-access-token"
    key_vault_id = data.azurerm_key_vault.launchdarkly.id
}