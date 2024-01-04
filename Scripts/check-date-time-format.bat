@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=check-date-time-format.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
REM ======================================================
set _dateY=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
set _timeY=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateY=%_dateY: =0%
set _timeY=%_timeY: =0%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_timeX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_timeX%.log
REM ======================================================
ECHO --------------%_namefile%_%_dateX%_%_timeX%-------------- >> %_log%
ECHO DATE FORMAT _dateX: (%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%) (%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%) >> %_log%
ECHO %_dateX%_%_timeX% >> %_log%
ECHO DATE FORMAT _dateY: (%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%) (%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%) >> %_log%
ECHO %_dateY%_%_timeY% >> %_log%
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateY%_%_timeY%-------------- >> %_log%
type %_log%
timeout 10