$Secure = Read-Host -AsSecureString
$Encrypted = ConvertFrom-SecureString -SecureString $Secure -Key (1..16)
$Encrypted | Set-Content Encrypted.txt
$Secure2 = Get-Content Encrypted.txt | ConvertTo-SecureString -Key (1..16)
$userId = "hemant673@gmail.com"
$password = $secure2
$cred = New-Object -TypeName System.Management.Automation.PSCredential($userId ,$password)
Login-AzureRmAccount -Credential $cred -TenantId "dda178af-5c06-4c58-8789-7da9a3c383ed"
New-AzureRmResourceGroup -Name myResourceGroup -Location EastUS
New-AzureRmVm `
-ResourceGroupName "myresourcegroup" `
-Credential $mycreds `
-Name "myVM" `
-Location "East US" `
-VirtualNetworkName "myVnet" `
-SubnetName "mySubnet" `
-SecurityGroupName "myNetworkSecurityGroup" `
-PublicIpAddressName "myPublicIpAddress" `
-OpenPorts 80,3389