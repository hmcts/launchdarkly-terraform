provider "azurerm" {
  features {}
}

provider "launchdarkly" {
  access_token = data.azurerm_key_vault_secret.launchdarkly-access.value
}

terraform {
  backend "azurerm" {}
  required_version = "=0.15.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.99.0"
    }
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "1.5.1"
    }
  }
}
