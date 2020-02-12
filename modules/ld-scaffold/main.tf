provider "launchdarkly" {
  version      = "~> 1.0"
  access_token = var.launchdarkly_access_token
}

resource "launchdarkly_project" "projects" {
  count = length(var.project_names)
  name  = element(var.project_names, count.index)
  key   = "${element(var.project_names,count.index)}-project"

  tags = [
    "terraform"
  ]

  environments {
   name = "Production"
   key = "production"
   color = "0a8b2f"
   tags = [
     "terraform"
   ]
  }

  environments {
   name = "AAT"
   key = "aat"
   color = "0a8b2f"
   tags = [
     "terraform"
   ]
  }

  environments {
   name = "Perftest"
   key = "perftest"
   color = "0a8b2f"
   tags = [
     "terraform"
   ]
   } 
} 


//resource "launchdarkly_environment" "environments" {
//  name = "Aat"
//  key = "aat"
//color = "#0a8b2f"
//  tags  = ["terraform", "staging"]
//}

