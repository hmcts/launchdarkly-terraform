provider "azurerm" {
  features {}
}

provider "launchdarkly" {
  access_token = data.azurerm_key_vault_secret.launchdarkly-access.value
}

terraform {
  backend "azurerm" {}
  required_version = "=1.2.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.52.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.6.0"
    }
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "2.12.0"
    }
  }
}
