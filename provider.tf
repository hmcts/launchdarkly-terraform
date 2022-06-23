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
      version = "3.10.0"
    }
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "1.5.1"
    }
  }
}
