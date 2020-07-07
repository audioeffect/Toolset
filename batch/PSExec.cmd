@echo off
cls
echo -------------------------------------
echo  PSExec.cmd - 03/04/19 - Cole Tirpak
echo -------------------------------------
echo.

echo Starting PSExec.cmd as admin on remote host (\\%1)...
timeout -t 2 > nul
psexec -u carle.com\%2 -p %3 \\%1 -e -h cmd.exe