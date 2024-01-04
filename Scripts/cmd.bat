@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=cmd.bat
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
set _log=C:\Scripts-logs\%_namefile%_%_dateY%_%_timeX%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
ECHO ----%_namefile%_%_dateY%_%_timeX%---- >> %_log%
C:\Windows\System32\cmd.exe /C powershell "Start-Process cmd -Verb RunAs"
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateY%_%_timeX%-------------- >> %_log%
