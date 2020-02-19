module "launchdarkly" {
  source = "./modules/ld-scaffold"

  project     = var.projects
  environment = var.environments
  tags        = var.tags
}

