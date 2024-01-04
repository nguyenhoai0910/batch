@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=export-eKYC.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N): "
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT) 
SET /P "pas=Enter Password: "
IF /I "%pas%"=="" (SET pas=%date:~10%%date:~4,2%%date:~7,2%) 
echo OCB%pas% > %_log%
%_7Zip% a -pOCB%pas% -sdel C:\Users\%username%\Downloads\export_%_dateX%.7z C:\Users\%username%\Downloads\export_%_dateX% >> %_log%
type %_log%
pause