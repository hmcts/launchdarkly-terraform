variable "environment_names" {
  description = "Create environments with these names"
}

variable "project_names" {
  description = "Create projects with these names"
}

variable "env_color" {
  description = "Default color to be assigned to all environments created"
  default = "0a8b2f"
}

variable "tags" {
  description = "Tags to be assigned to all resources created"
  default = [
    "terraform",
  ]
}

variable "launchdarkly_token" {
  description = "Map containing details to retrieve the launchdarkly token required by the provider"
  default = {
    launchdarkly_kv_name = "rpe-prod"
    launchdarkly_kv_rg = "rpe-prod"
    launchdarkly_kv_secret_name = "ld-automation-token"
  }
}