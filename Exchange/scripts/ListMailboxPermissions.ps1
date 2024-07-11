# Get the current PowerShell version
$PSVersion = $PSVersionTable.PSVersion

# Check if the major version is less than 7
if ($PSVersion.Major -lt 7) {
    Write-Warning "You are running PowerShell version $($PSVersion.Major). Please upgrade to PowerShell 7.0 or later."
    exit
}

# Import the necessary functions
. $PSScriptRoot\..\src\Authentication\Public\Authenticate.ps1
. $PSScriptRoot\..\src\MailboxPermissions\Public\Permissions.ps1
. $PSScriptRoot\..\src\Logging\Public\Log-It.ps1

# Define the user whose mailbox permissions you want to check
$UserMailbox = Read-Host -Prompt "Enter the username of the mailbox you want to check"

# Connect to Exchange Online
Connect-Exchange

# Get and output the Mailbox permissions for the specified user
$MailBoxPermissions = Get-MailboxPermissions -UserMailbox $UserMailbox
$MailBoxPermissions

# Log the mailbox permissions
LogIt -message "Mailbox permissions for ${UserMailbox}: ${MailBoxPermissions}" -component "ListMailboxPermissions" -type 1 -remoteScriptName "ListMailboxPermissions.ps1"

# Disconnect the session
Disconnect-Exchange