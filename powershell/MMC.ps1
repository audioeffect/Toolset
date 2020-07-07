#Pass computer parameter
Param
(
    $computername
)

# Import module and run script elevated
if(!$Elevated){
    Import-Module  "\\tsupport\tsupload\Cole\PS\Modules\Restart-Elevated.psm1"
    Restart-Elevated -PassedCommand $PSCommandPath -PassedParam $PSBoundParameters
}

#Introduction
Write-Host "----------------------------------------------------------------------"
Write-Host " MMC.ps1 by Cole Tirpak - 04/01/2019"
Write-Host
Write-Host " Run custom MMC with AD, Print Management, and Computer Management..."
Write-Host "----------------------------------------------------------------------"
Write-Host

#Process
#$user=Read-Host Enter admin username
#$cred=Get-Credential -Credential carle.com\$user
$mmcPath = "C:\Windows\System32\mmc.exe"
$path = "$PSScriptRoot\..\tools\ct-hd.msc"
Start-Process -FilePath $mmcpath -ArgumentList $path