provider "azurerm" {
  version = "=1.44.0"
  subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
}

module "launchdarkly" {
  source = "./modules/ld-scaffold"

  project      = var.projects
  environment  = var.environments
  tags         = var.tags
}

