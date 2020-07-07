@echo off
cls
echo --------------------------------------------
echo  DeleteUpdates.cmd - 03/08/19 - Cole Tirpak
echo --------------------------------------------
echo.

echo Starting DelUpdates.cmd as admin on remote host (\\%1)...
timeout -t 2 > nul
psexec -u carle.com\%2 -p %3 \\%1 -e -h "\\tsupport\tsupload\Cole\Toolset\batch\DelUpdates.cmd"