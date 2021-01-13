# launchdarkly-terraform
Terraform to create/manage projects within Launchdarkly. Feature toggles are created directly in the LaunchDarkly portal. 

# Adding a new project

## Prerequisites:

A team Azure Active Directory group, this is normally setup when you join, but if you don't have one ask the Platform Operations team to create it for you. 

You will require the Object ID of the Azure AD Group to complete the setup.

The ID can be looked up with:
```shell
az ad group list --query "[?contains(displayName, 'cmc')].{DisplayName: displayName, ObjectID: objectId}" -o table
```

## Steps: 

To add a new project, open the terraform.tfvars file and add the following values under the Project variable:

Example: 

```
{
    name          = "Platform"
    azuread_group = "c36eaede-a0ae-4967-8fed-0a02960b1233"
},
```

Where - name = the name of the project/team.
      - azuread_group= Object ID of the Azure AD Group required in the prerequisites

