variable "launchdarkly_access_token" {
  description = "The Launchdarkly access token required to provision resources"
}

variable "project_names" {
  description = "Create projects with these names"
  type        = list
}

/*variable "environments" {
  description = "Create environments with these names"
  type = map
  default = {

  }
}*/