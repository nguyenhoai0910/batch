@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
REM ======================================================
:loop
set _namefile=check_SCP.v2.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
echo %_dateX%_%_timeX%
REM ======================================================
@set a=7
@set b=10
@set/a LWeekX=%DATE:~7,2%-%a%
if %LWeekX% LSS %b% (set LWeekX=0%Yest%)
set _LastWeekX=%DATE:~10,4%%DATE:~4,2%%LWeekX%
echo %_LastWeekX%
REM ======================================================
set _LWlog=C:\Scripts-logs\%_namefile%_%_LastWeekX%.log
set _log=C:\Scripts-logs\%_namefile%_%_dateX%.log
set _logrs=C:\Scripts-logs\restart_SCP_%_dateX%.log
echo %_LWlog% %_log% %_logrs%
REM ======================================================
echo %_namefile%_%_dateX%_%_timeX%
powershell "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; (Invoke-WebRequest https://scp.ocb.com.vn).StatusCode"
for /F %%x in ('powershell "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; (Invoke-WebRequest https://scp.ocb.com.vn).StatusCode"') do ( 
SET status_code=%%x 
echo %_namefile%_%_dateX%_%_timeX% status_code: ^| %status_code%  >> %_log% 
)
if %status_code% NEQ 200 (
sc stop supportcenter
timeout 5
sc start supportcenter
echo %_namefile%_%_dateX%_%_timeX% restart complete! ^| %status_code% >> %_logrs% 
timeout 360) 
if exist %_LWlog% del %_LWlog% >NUL  2>NUL
goto loop
