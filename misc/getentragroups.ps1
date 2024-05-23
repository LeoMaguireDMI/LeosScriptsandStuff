# Connect to Microsoft Graph (you may need to authenticate first)
Connect-MgGraph -Scopes "User.Read.All", "GroupMember.Read.All", "Group.Read.All", "Directory.Read.All"

# Create an empty array to hold the group data
$groupData = @()

# Initialize skip token
$skipToken = $null

# Loop through each group and extract its details
do {
    # Get a list of 100 groups at a time
    if ($null -eq $skipToken) {
        $entraGroups = Get-MgGroup -All:$true
    } else {
        $entraGroups = Get-MgGroup -Top 100 -SkipToken $skipToken
    }

    foreach ($group in $entraGroups) {
        if ($group.DisplayName) {
            write-host "Processing group: $($group.DisplayName)"}
        # Get the group owner
        $groupOwner = Get-MgGroupOwner -GroupId $group.Id | Select-Object -First 1

        # Create a custom object with the group name, group ID, group owner
        $obj = New-Object PSObject
        $obj | Add-Member -MemberType NoteProperty -Name "Group Name" -Value $group.DisplayName
        $obj | Add-Member -MemberType NoteProperty -Name "Group ID" -Value $group.Id
        $obj | Add-Member -MemberType NoteProperty -Name "Group Owner" -Value $groupOwner.UserPrincipalName
        $obj | Add-Member -MemberType NoteProperty -Name "Is Security Group" -Value $group.SecurityEnabled

        # Add the custom object to the group data array
        $groupData += $obj
    }

    # Get the skip token for the next page of groups
    if ($null -ne $entraGroups.AdditionalData) {
        if ($null -ne $entraGroups.AdditionalData["@odata.nextLink"]) {
            $skipToken = $entraGroups.AdditionalData["@odata.nextLink"].Split('=')[-1]
        } else {
            $skipToken = $null
        }
    } else {
        $skipToken = $null
    }
} while ($null -ne $skipToken)

# Export the group data array to a CSV file
try {
    $groupData | Export-Csv -Path "..\results\grouplist.csv" -NoTypeInformation -Force
    Write-Host "Group List exported to grouplist.csv one folder level up from here."
} catch {
    Write-Host "Error exporting to CSV: $_"
}