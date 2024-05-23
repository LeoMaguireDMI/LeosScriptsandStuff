# Connect to Microsoft Graph
Connect-MgGraph -Scopes "RoleManagement.Read.Directory"

Get-AzResourceGroup -Tag @{'Group_Owner'='Infrastructure'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'Environment'='Production'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'Environment'='UAT'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'Environment'='Dev'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'InternetFacing'='Yes'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'App'='Sonicwall'} | Select-Object ResourceGroupName
Get-AzResourceGroup -Tag @{'DeviceType'='Network'} | Select-Object ResourceGroupName