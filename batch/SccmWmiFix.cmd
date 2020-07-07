@echo off
cls
echo ---------------------------------------
echo  SccmWmiFix.cmd - 5/7/18 - Cole Tirpak
echo ---------------------------------------
echo.

set PCName=%1
set UserID=%2 

"\\tsupport\Utils\SysinternalsSuite\psexec.exe" -u carle.com\%UserID% -p %3 \\%PCName% -h -e "\\tsupport\Utils\Fix WMI and install SCCM Client.cmd"

echo Program finishing and will close in 10 Seconds.
ping -n 11 -w 1000 127.0.0.1 > nul
cls
exit