$vaultName = 'infra-azvault'
$keyVaule = 'dmisecops'
$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $keyVaule -AsPlainText

Write-Output $keyVaule
Write-Output $secret