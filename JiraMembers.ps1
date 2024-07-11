# Import the required module
Install-Module Microsoft.Graph

# Connect to the directory
Connect-MgGraph -Scopes "Group.ReadWrite.All"

# Retrieve all groups
$allGroups = Get-MgGroup -All

# Filter for groups with 'JIRA' in the name and count the members
$jiraGroups = $allGroups | Where-Object { $_.DisplayName -like "*JIRA*" }
foreach ($group in $jiraGroups) {
    $groupId = $group.Id
    $groupMembers = Get-MgGroupMember -GroupId $groupId
    $memberCount = $groupMembers.Count
    Write-Output ("Group '{0}' has {1} members." -f $group.DisplayName, $memberCount)
}