data "azurerm_key_vault" "launchdarkly_kv" {
    name = var.launchdarkly_token.launchdarkly_kv_name
    resource_group_name = var.launchdarkly_token.launchdarkly_kv_rg
}

data "azurerm_key_vault_secret" "launchdarkly_kv_secret" {
    name = var.launchdarkly_token.launchdarkly_kv_secret_name
    key_vault_id = data.azurerm_key_vault.launchdarkly_kv.id
}