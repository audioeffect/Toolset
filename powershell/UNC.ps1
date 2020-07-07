#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------------"
Write-Host " UNC.ps1 by Cole Tirpak - 02/25/2019"
Write-Host
Write-Host " Access C$ on remote host (\\$computername)..."
Write-Host "-------------------------------------------------------"
Write-Host

#Process
$user = Read-Host "Enter admin username"
$cred = Get-Credential -Credential carle.com\$user
Write-Host

New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\$computername\c$" -Credential $cred
Write-Host

Invoke-Item -LiteralPath "Z:\"
Write-Host "Opening File Explorer..."
Start-Sleep -Seconds 1
Write-Host "Exiting..."
Start-Sleep -Seconds 2