# launchdarkly-terraform

Terraform to create/manage projects within LaunchDarkly. Feature toggles are created directly in the LaunchDarkly portal. 

# Adding a new project

## Prerequisites:

A team Azure Active Directory group, this is normally setup when you join, but if you don't have one ask the Platform Operations team to create it for you. 

## Steps: 

To add a new project, open the [terraform.tfvars](terraform.tfvars) file and add the following values under the Project variable:

Example: 

```
{
    name          = "MyTeam"
    azuread_group = "My Teams AzureAd group display name"
},
```

Where:
* name = the name of the project/team.
* azuread_group= Display name of the Azure AD Group required in the prerequisites

