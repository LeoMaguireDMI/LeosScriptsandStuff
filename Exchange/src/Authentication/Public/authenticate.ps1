# Force PowerShell to use TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Connect-Exchange {
    # Check if the ExchangeOnlineManagement module is installed
    if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
        # Install the PowerShellGet module
        Install-Module -Name PowerShellGet -Force -AllowClobber -Confirm:$false
        # Install the ExchangeOnlineManagement module
        Install-Module -Name ExchangeOnlineManagement -Force -Confirm:$false
    }

    # Import the ExchangeOnlineManagement module
    Import-Module ExchangeOnlineManagement

    # Connect to Exchange Online
    Connect-ExchangeOnline
}

function Disconnect-Exchange {
    # Disconnect the session without confirmation
    Disconnect-ExchangeOnline -Confirm:$false
}

Export-ModuleMember -Function Connect-Exchange, Disconnect-Exchange