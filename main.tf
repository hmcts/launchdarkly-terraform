provider "azurerm" {
  version = "=1.44.0"
}

module "launchdarkly" {
  source = "./modules/ld-scaffold"

  project_names      = var.project_names
  environment_names  = var.environment_names
  tags               = var.tags
}

