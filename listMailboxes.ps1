# Ask for the file name
$FileName = Read-Host -Prompt "Enter the file name"

# Read the file
$ExchangeServers = Get-Content $FileName

# Cycle through each Exchange server
foreach ($ExchangeFQDN in $ExchangeServers) {
    # Get the credentials for connecting to the Exchange server
    $ExchangeCredential = Get-Credential -Message "Enter your Exchange admin credentials for $ExchangeFQDN"

    # Establish a remote session to the Exchange server
    Write-Host "Establishing a remote session to the Exchange server..."
    Try {
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeFQDN/PowerShell/ -Authentication Kerberos -Credential $ExchangeCredential
        Import-PSSession $session -DisableNameChecking -AllowClobber -ErrorAction Stop
        Write-Host "Successfully established a remote session and imported Exchange cmdlets."
    }
    Catch {
        Write-Host "Failed to establish a remote session to the Exchange server. Please ensure the FQDN and credentials are correct."
        Continue
    }

    # List all mailboxes
    Write-Host "Listing all mailboxes on the Exchange server..."
    Try {
        $Mailboxes = Get-Mailbox -ResultSize Unlimited -ErrorAction Stop
        $Mailboxes | ForEach-Object {
            $_.PrimarySmtpAddress
        } | Out-File -FilePath "$ExchangeFQDN.txt"
    }
    Catch {
        Write-Host "Failed to list mailboxes."
    }

    # Output the mailboxes
    Write-Host "Outputting the mailboxes..."
}