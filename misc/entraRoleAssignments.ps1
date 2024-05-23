# Connect to Microsoft Graph with the necessary scopes
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "ServicePrincipal.Read.All", "RoleManagement.Read.Directory"

# Specify the role ID for which you want to get role assignments
$roleId = "62e90394-69f5-4237-9190-012177145e10"

# Retrieve role assignments for the specified role
$roleAssignments = Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$roleId'"

foreach ($roleAssignment in $roleAssignments) {
    $principalId = $roleAssignment.PrincipalId
    try {
        # Attempt to fetch the principal as a user
        $user = Get-MgUser -UserId $principalId
        if ($user) {
            Write-Output "Principal ID: $principalId is a User with UPN: $($user.UserPrincipalName)"
        }
    } catch {
        try {
            # If not a user, attempt to identify if it's a group
            $group = Get-MgGroup -GroupId $principalId
            if ($group) {
                Write-Output "Principal ID: $principalId is a Group."
                continue
            }
        } catch {
            try {
                # If not a group, attempt to identify if it's a service principal
                $servicePrincipal = Get-MgServicePrincipal -ServicePrincipalId $principalId
                if ($servicePrincipal) {
                    Write-Output "Principal ID: $principalId is a Service Principal."
                    continue
                }
            } catch {
                Write-Output "Principal ID: $principalId could not be identified as a User, Group, or Service Principal."
            }
        }
    }
}
