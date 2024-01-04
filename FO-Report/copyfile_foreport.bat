@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
REM LOG: >> C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
set _namefile=copyfile_foreport.bat
SET _PATH0=C:\Users\%username%\Desktop\
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
REM =======================================
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
REM =======================================
IF EXIST C:\Users\%username%\Desktop\Trienkhai MKDIR C:\Users\%username%\Desktop\Trienkhai
set _7zip="C:\Program Files\7-Zip\7z.exe"
set _PATH0=E:\_Backup\FO-Report\%_dateX%_%_timeX%
set _PATH1=D:\Website\FO-Report
set _PATH2=C:\Users\%username%\Desktop\Trienkhai\FO-Report

ECHO ==========BEGIN %_dateX%_%_timeX% ========== >> %_log%
:loop
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (goto quit)
SET /P "_FILE1=Enter File: "
SET /P "_PATH1=Enter Path: "
move %_PATH1%\%_FILE1% %_PATH0%\%_FILE1% >> %_log%
ren %_PATH0%\%_FILE1% Deprecated_%_dateX%_%_timeX%_%_FILE1% >> %_log%
copy %_PATH2%\%_FILE1% %_PATH1% >> %_log%
goto loop
ECHO ==========DONE %_dateX%_%_timeX% ========== >> %_log%
type %_log%
:quit
ECHO goodbye! & timeout 4 & EXIT