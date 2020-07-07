#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "----------------------------------------------------"
Write-Host " FastAccounts.ps1 by Cole Tirpak - 04/17/2018"
Write-Host
Write-Host " Create fast account for remote host (\\$computername)..."
Write-Host "----------------------------------------------------"
Write-Host

#Process
$test = Read-Host "Creating a fast account. Would you like to proceed? (y/n)"
if($test -ne "y"){
    Exit
}
$path="\\Collect\FastAccts"
New-Item -Path "$path" -Name "$computername.txt" -Force > $null
if(Test-Path "$path\$computername.txt"){
    Write-Host "$computername.txt was created"
    Invoke-Item $path
}
else{
    Read-Host -Prompt "File creation failed. Press ENTER to exit and try again"
    Exit
}
Write-Host

#Write-Host "Looking for completed log..."
#While(!(Test-Path "$path\done_$computername.log")){Start-Sleep 1}

#Write-Host "Completed"
#notepad "$path\done_$computername.log"
#Write-Host

#Write-Host "Pausing script until Notepad is closed..."
#$nid=(Get-Process notepad).id
#Wait-Process -Id $nid
#Write-Host

#Write-Host "Moving completed log to Old"
#Move-Item "$path\done_$computername.log" "$path\old\" -Force
timeout /t 2