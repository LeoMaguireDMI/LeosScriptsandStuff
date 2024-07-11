# Connect to Exchange Online
try {
    Connect-Exchange -ErrorAction Stop
}
catch {
    Write-Error "Failed to connect to Exchange Online: $($_)"
    exit
}

# Retrieve all mailboxes
try {
    $allMailboxes = Get-Mailbox -ResultSize Unlimited -ErrorAction Stop
}
catch {
    Write-Error "Failed to retrieve mailboxes: $($_)"
    Disconnect-Exchange
    exit
}

# Loop through the first ten mailboxes
$allMailboxes | Select-Object | ForEach-Object {
    $mailbox = $_
    $UserMailbox = $mailbox.Identity

    try {
        # Retrieve the WhenCreated and WhenMailboxCreated dates
        $mailboxInfo = Get-Mailbox -Identity $UserMailbox | Select-Object WhenCreated, WhenMailboxCreated
    }
    catch {
        Write-Error "Failed to retrieve mailbox information for ${UserMailbox}: $($_)"
        return
    }

    # Create a custom object for the output
    $output = New-Object PSObject -Property @{
        User = $UserMailbox
        Created = $mailboxInfo.WhenCreated
        Migrated = $mailboxInfo.WhenMailboxCreated
    }

    # Export the output to the CSV file
    $output | Export-Csv -Path .\migratedmailboxes.csv -NoTypeInformation -Append
}

# Disconnect the session
Disconnect-Exchange