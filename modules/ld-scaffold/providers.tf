provider "launchdarkly" {
  version      = "~> 1.0"
  access_token = data.azurerm_key_vault_secret.launchdarkly-access.value
}