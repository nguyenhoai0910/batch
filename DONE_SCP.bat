@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\SCP.bat
REM LOG: >> C:\Scripts-logs\SCP.bat_%date:~10%%date:~4,2%%date:~7,2%.log
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
call :main >> C:\Scripts-logs\SCP.bat_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
:main
echo %date%_%time%
for /F "tokens=3 delims=: " %%x in ('sc queryex "supportcenter"^|findstr "STATE"') do ( echo %%x & if /I "%%x" NEQ "RUNNING" (sc start supportcenter))
exit /b