#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------------"
Write-Host " GPUpdate.ps1 by Cole Tirpak - 04/17/2018"
Write-Host
Write-Host " Run group policy update on remote host (\\$computername)..."
Write-Host "-------------------------------------------------------"
Write-Host

#Process
$user = Read-Host "Enter admin username"
$cred=Get-Credential -Credential carle.com\$user
Start-Process -FilePath "psexec.exe" -ArgumentList "\\$computername gpupdate /force" -Credential $cred
#runas /user:carle.com\$user "\\tsupport\utils\SysinternalsSuite\psexec.exe \\$computername gpupdate /force"