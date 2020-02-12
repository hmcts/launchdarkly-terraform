variable "environment_names" {
  description = "Create environments with these names"
  type = list(object({
    name  = string
    color = string
    key   = string
    tags  = list(string)
  }))
}

variable "launchdarkly_access_token" {
  description = "The Launchdarkly access token required to provision resources"
}

variable "project_names" {
  description = "Create projects with these names"
  type        = list(any)
}