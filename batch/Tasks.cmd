@echo off
set computer=%1
set user=%2
set path=%3\logs\tasks_%user%.log
cd c:\windows\system32
cls
echo ------------------------------------
echo  Tasks.cmd - 03/05/19 - Cole Tirpak
echo ------------------------------------
echo.

echo Creating log file of TaskList...
tasklist /s %computer%>%path%
echo.

echo Opening log file of TaskList...
start %path%
echo.

set /p pid=Enter PID of task to kill: 
echo.

echo Running TaskKill...
taskkill /s %computer% /pid %pid%
echo.

echo Deleting log file of TaskList...
del %path%
echo.

pause