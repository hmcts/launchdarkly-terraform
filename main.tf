provider "azurerm" {
  version = "=1.44.0"
}

module "launchdarkly" {
  source = "./modules/ld-scaffold"

  project     = var.projects
  environment = var.environments
  tags        = var.tags
}

