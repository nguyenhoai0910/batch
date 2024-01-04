@echo off
title Loading... By El Mano
color 0a
set load=
set/a loadnum=0
:Loading
set load=%load%()
cls
echo.
echo Loading... Please Wait...
echo ----------------------------------------
echo %load%
echo ----------------------------------------
set/a loadnum=%loadnum% +1
if %loadnum%==20 goto Done
rem You can set the number of ()'s as whatever you rem want but remember: in your "loading box" you rem need 2 spaces for every () because "()" takes up rem 2 spaces. The above box has 40 spaces, so rem twenty repeats, adding 1 () every repeat.
goto Loading
:Done
echo.
rem *your action here*
notepad C:\Windows\System32\drivers\etc\hosts
pause
exit