environments = [
  "Production",
  "Test"
]

projects = [
  {
    name          = "CMC"
    azuread_group = "dcd_cmc"
  },
  {
    name          = "Probate"
    azuread_group = "dcd_probate"
  },
  {
    name          = "PCQ"
    azuread_group = "dcd_group_pcq_v2"
  },
  {
    name          = "Divorce"
    azuread_group = "dcd_divorce"
  },
  {
    name          = "Fees-Pay"
    azuread_group = "dcd_group_fees&pay_v2"
  },
  {
    name          = "SSCS"
    azuread_group = "dcd_sscs"
  },
  {
    name          = "rd"
    azuread_group = "dcd_group_referencedata_v2"
  },
  {
    name          = "am"
    azuread_group = "dcd_group_accessmanagement_v2"
  },
  {
    name          = "unspec"
    azuread_group = "dcd_group_unspec_v2"
  },
  {
    name          = "Work-Allocation"
    azuread_group = "dcd_group_wa_v2"
  },
  {
    name          = "FaCT"
    azuread_group = "DTS FaCT"
  }
]
