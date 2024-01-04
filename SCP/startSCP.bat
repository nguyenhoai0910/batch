@ECHO off
set _namefile=startSCP.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
echo %_dateX%_%_timeX% >> %_log%
sc stop supportcenter
timeout 15
sc start supportcenter
type C:\Scripts-logs\startSCP.bat_%date:~10%%date:~4,2%%date:~7,2%.log
