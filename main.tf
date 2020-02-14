provider "azurerm" {
  version = "=1.44.0"
}

provider "azurerm" {
  alias = "DCD-CNP-PROD"
  subscription_id = "8999dec3-0104-4a27-94ee-6588559729d1"
}

module "launchdarkly_prod" {
  source = "./modules/ld-scaffold"

  project_names     = var.project_names
  environment_names = var.environment_names
  tags = var.tags
  env_color = var.env_color
  launchdarkly_token = var.launchdarkly_token
}

