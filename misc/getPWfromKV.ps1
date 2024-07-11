$vaultName = 'infra-azvault'
$keyVaule = 'dmisecops'
$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $keyVaule -AsPlainText
Connect-AzAccount
Write-Output $keyVaule
Write-Output $secret