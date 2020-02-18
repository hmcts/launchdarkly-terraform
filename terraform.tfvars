environments = [
  "Production",
  "AAT",
  "Perftest"
]

projects = [
  {
    name          = "Platform"
    azuread_group = "dcd_group_ld_automation"
  },
  {
    name          = "IDAM"
    azuread_group = "dcd_group_ld_automation2"
  }
]