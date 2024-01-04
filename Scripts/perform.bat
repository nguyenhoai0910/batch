@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=perform.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
if not exist C:\PerfLogs\OCB\Monitors mkdir C:\PerfLogs\OCB\Monitors
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
ECHO ----%_namefile%_%_dateX%_%_timeX%---- >> %_log%
cmd.exe /c "perfmon"
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%
