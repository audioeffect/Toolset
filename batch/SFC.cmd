@echo off
cls
echo --------------------------------
echo  SFC.cmd - 5/7/18 - Cole Tirpak
echo --------------------------------
echo.

psexec \\%1 sfc /scannow
echo.

pause
notepad.exe \\%1\c$\Windows\Logs\CBS\CBS.log