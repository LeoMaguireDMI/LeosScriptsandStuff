# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ask for the file name
$FileName = Read-Host -Prompt "Enter the file name"

# Ask for the Exchange server
$ExchangeServer = Read-Host -Prompt "Enter the Exchange server"

# Read the file
$UserMailboxes = Get-Content $FileName

# Establish a remote session to the Exchange server
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeServer/PowerShell/ -Authentication Kerberos
Import-PSSession $session -DisableNameChecking -AllowClobber

# Cycle through each mailbox
foreach ($UserMailbox in $UserMailboxes) {
    # Get the Mailbox permissions for the specified user
    try {
        $MailBoxPermissions = Get-MailboxPermission -Identity $UserMailbox | Where-Object { $_.IsInherited -eq $false } | Select-Object User, @{Name='UPN';Expression={(Get-User -Identity $_.User.ToString()).UserPrincipalName}}, AccessRights, IsInherited, Deny
        # Output the mailbox permissions
        Write-Host "Permissions for ${UserMailbox}:"
        $MailBoxPermissions
    } catch {
        Write-Host "Failed to get permissions for ${UserMailbox}: $($_.Exception.Message)"
    }
}

# Remove the session
Remove-PSSession $session