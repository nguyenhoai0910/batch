@echo off
rem C:\Users\hoainh\Desktop\yesterday.bat
@set a=1
@set b=10
@set/a Yest=%date:~3,2%-%a%
if %Yest% LSS %b% (set Yest=0%Yest%)
set Yesterdate=%date:~6,4%%date:~0,2%%Yest%
echo %Yesterdate%
pause

