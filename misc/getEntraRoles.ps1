# Connect to Microsoft Graph
Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

# Get all role definitions
$roleDefinitions = Get-MgRoleManagementDirectoryRoleDefinition

# Create an empty array to hold the role data
$roleData = @()

# Output the role definitions
foreach ($roleDefinition in $roleDefinitions) {
    # Create a custom object with the role name and role ID
    $obj = New-Object PSObject
    $obj | Add-Member -MemberType NoteProperty -Name "Role Name" -Value $roleDefinition.DisplayName
    $obj | Add-Member -MemberType NoteProperty -Name "Role ID" -Value $roleDefinition.Id

    # Add the custom object to the role data array
    $roleData += $obj
}

# Export the role data array to a CSV file
$roleData | Export-Csv -Path "../results/rolelist.csv" -NoTypeInformation
Write-Host "Role List exported to rolelist.csv."
