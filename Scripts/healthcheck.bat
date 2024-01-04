@ECHO off
set _namefile=healthcheck.bat
REM Created: Sept 30, 2023
REM Last modified: Sept 30, 2023
REM Version: 1.0
set _home="cd C:\Users\%username%\Desktop\"
REM ======================================================
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
set _datetimeX=%_dateX%_%_timeX%
REM ======================================================
REM set _dateY=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
REM set _timeY=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
REM set _dateY=%_dateY: =0%
REM set _timeY=%_timeY: =0%
REM set _datetimeY=%_dateY%_%_timeY%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
tasklist /fi "memusage gt 100000" /fi "CPUTIME ge 00:00:00" /v >> %_log%
type %_log%
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%
echo.
echo ======================================================
echo Log script save at: %_log%
