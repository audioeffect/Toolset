:check
@echo off
echo ----------------------------------------
echo  MBAMStatus.cmd - 7/18/18 - Cole Tirpak
echo ----------------------------------------
echo.

manage-bde -cn %1 -status c:
timeout -t 15 > nul
cls
goto :check
