# Import the Active Directory module
Write-Host "Importing the Active Directory module..."
Try {
    Import-Module ActiveDirectory -ErrorAction Stop
    Write-Host "Successfully imported the Active Directory module."
}
Catch {
    Write-Host "Failed to import the Active Directory module. Please ensure it is installed."
    Exit
}

# Prompt for the FQDN of the Exchange server
$ExchangeFQDN = Read-Host "Enter the FQDN of the Exchange server"

# Get the credentials for connecting to the Exchange server
$ExchangeCredential = Get-Credential -Message "Enter your Exchange admin credentials"

# Establish a remote session to the Exchange server
Write-Host "Establishing a remote session to the Exchange server..."
Try {
    $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeFQDN/PowerShell/ -Authentication Kerberos -Credential $ExchangeCredential
    Import-PSSession $session -DisableNameChecking -AllowClobber -ErrorAction Stop
    Write-Host "Successfully established a remote session and imported Exchange cmdlets."
}
Catch {
    Write-Host "Failed to establish a remote session to the Exchange server. Please ensure the FQDN and credentials are correct."
    Exit
}

# Get the credentials for AD
$ADCredential = Get-Credential -Message "Enter your AD admin credentials"

# Try to get all Exchange servers
Write-Host "Getting all Exchange servers..."
Try {
    $ExchangeServers = Get-ADComputer -Filter {Name -like "*EXCH*"} -Credential $ADCredential -ErrorAction Stop
    Write-Host "Successfully retrieved Exchange servers."
}
Catch {
    Write-Host "Failed to get Exchange servers. Please ensure you have the necessary permissions."
    Exit
}

# Output the Exchange servers
Write-Host "Outputting the Exchange servers..."
$ExchangeServers | Format-Table -Property Name, DNSHostName

# Clean up the remote session
Remove-PSSession $session
Write-Host "Closed the remote session."
