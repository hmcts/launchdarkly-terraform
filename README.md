# launchdarkly-terraform
Terraform to create/manage feature toggle using LaunchDarkly

# Adding a new project

## Prerequisites:

A request to the DevOps team to create an Azure AD Group granting access to the LaunchDarkly application and include all users that will require access. You will require the Object ID of the Azure AD Group to complete the setup. 

## Steps: 

To add a new project, open the terraform.tfvars file and add the following:

    - Name of the project
    - Object ID of the Azure AD Group required in the prerequisites