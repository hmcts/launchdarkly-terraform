# Scaffold setup for LaunchDarkly

The following module will do the initial setup for LaunchDarkly for a team. The module will build the following components:
1. Multiple Projects with an ability to add new projects.]
2. Standrad Environment for teams with an ability to add more.
3. Role creation for teams for individual projects

## Roles

Each project gets one full-access role mapped to its `azuread_group`.

Adding `admin_azuread_group` splits it into `<name>_admin` (full access) and `<name>_member`
(`azuread_group`, full non-prod, read-only on prod flags). `member_protected_environments`
overrides the restricted environments (default `["production"]`).