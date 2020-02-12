provider "launchdarkly" {
  version      = "~> 1.0"
  access_token = var.launchdarkly_access_token
}

module "launchdarkly_prod" {
  source = "./modules/ld-scaffold"

  project_names     = var.project_names
  environment_names = var.environment_names
  tags = var.tags
  env_color = var.env_color
}

