# launchdarkly-terraform
Terraform to create/manage projects within Launchdarkly. Feature toggles are created directly in the LaunchDarkly portal. 

# Adding a new project

## Prerequisites:

A request to the DevOps team to create an Azure AD Group granting access to the LaunchDarkly application and include all users that will require access. You will require the Object ID of the Azure AD Group to complete the setup. 

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

