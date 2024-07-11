# Install necessary modules (run only once)
Install-Module -Name ExchangeOnlineManagement -Force

# Connect to Exchange Online
$UserCredential = Get-Credential
Connect-ExchangeOnline -Credential $UserCredential

# Prompt for the mailbox SMTP address
$mailboxSMTP = Read-Host "Enter the SMTP address of the mailbox you want to query"

# Get mailbox details by SMTP address
$mailbox = Get-Mailbox -Identity $mailboxSMTP

if ($mailbox) {
    Write-Output "Details for mailbox: $($mailbox.DisplayName)"
    Write-Output "WhenCreated: $($mailbox.WhenCreated)"
    Write-Output "ExchangeVersion: $($mailbox.ExchangeVersion)"
    
    # Get more detailed information if needed
    $mailboxStats = Get-MailboxStatistics -Identity $mailbox.Alias
    Write-Output "LastLogonTime: $($mailboxStats.LastLogonTime)"

    # Search for detailed migration log if necessary
    $auditLogs = Search-MailboxAuditLog -Mailbox $mailbox.Alias -ShowDetails | Where-Object { $_.Operation -eq "MoveMailbox" }
    if ($auditLogs) {
        Write-Output "Migration details:"
        $auditLogs | Select-Object Operation,LogonType,ResultStatus,ExternalAccess,LastAccessed | Format-Table -AutoSize
    } else {
        Write-Output "No migration logs found for mailbox $mailboxSMTP."
    }
} else {
    Write-Output "Mailbox $mailboxSMTP not found."
}

# Disconnect session
Disconnect-ExchangeOnline -Confirm:$false