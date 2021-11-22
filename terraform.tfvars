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
    name          = "civil"
    azuread_group = "DTS Civil"
  },
  {
    name          = "Work-Allocation"
    azuread_group = "dcd_group_wa_v2"
  },
  {
    name          = "FaCT"
    azuread_group = "DTS FaCT"
  },
  {
    name          = "expert-ui"
    display_name  = "Expert UI"
    azuread_group = "dcd_group_expertui_v2"
  },
  {
    name          = "fpla"
    display_name  = "FPLA"
    azuread_group = "dcd_group_fpl_v2"
  },
  {
    name          = "ia"
    display_name  = "Immigration and Asylum"
    azuread_group = "dcd_ia"
  },
  {
    name          = "idam"
    display_name  = "IDAM"
    azuread_group = "dcd_idam"
  },
]
