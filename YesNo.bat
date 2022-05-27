@echo off
color 01
title Yes or No
cls
:A
echo.
echo.
echo Wellcome, to the Yes or No prompt...
echo.
set /p menu=Do you want to continue?	(Y/N)	
if %menu%==Y goto Yes
if %menu%==y goto Yes
if %menu%==N goto No
if %menu%==n goto No
cls
echo.
echo please answer me!...
echo.
goto A

:Yes
echo.
echo Okey, let's continue...
echo.
call wellcome.bat
exit

:No
echo.
echo Okey, let's exit...
echo.
call goodbye.bat
exit