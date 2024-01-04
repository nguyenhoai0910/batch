@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM set _PATH=C:\Scripts\renfile.bat
REM E:\BACKUP_LAPTOP\20230731\Quitrinh\batch\swift\ren_swift.bat
set _namefile=file-rename.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
set _datetimeX=%_dateX%_%_timeX%
REM ======================================================
REM set _dateY=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
REM set _timeY=%TIME:~0,2%%TIME:~3,2%
REM set _dateY=%_dateY: =0%
REM set _timeY=%_timeY: =0%
REM set _datetimeY=%_dateY%_%_timeY%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_datetimeX%.log
REM ======================================================
SET _PATH2=C:\Users\%username%\Desktop
:begin
REM ========================================================
cls
echo -
echo 1) Change file to Deprecated_
echo 2) Copy a file to path
echo 3) Change Deprecated_ to file
echo -
REM ========================================================
set /p op=Type option:
if "%op%"=="0" goto op0
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="exit" goto exit
echo Please Pick an option:
goto begin

:op0
echo you picked option 0 "Show logs file ..."
echo "Log script save at: " %_log%
echo -----------------------------
type %_log%
pause
goto begin

:op1
echo you picked option 1 "Change file to Deprecated_ ..."
SET /P "_PATH1=Enter Path (C:\Users\%username%\Desktop\for ):
REM SET _PATH1=C:\Users\%username%\Desktop\for
SET /P "_FILE1=Enter Name File (maintenance_land.png ):
REM SET _FILE1=maintenance_land.png
if not exist %_PATH1%\Deprecated_%_dateX%_%_FILE1% FORFILES /P %_PATH1% /M %_FILE1% /C "cmd /c echo \"%_PATH1%\@file --- Deprecated_%_dateX%_%_FILE1%\" && ren %_PATH1%\%_FILE1% Deprecated_%_dateX%_%_FILE1% " >> %_log%
if exist %_PATH1%\Deprecated_%_dateX%_%_FILE1% FORFILES /P %_PATH1% /M %_FILE1% /C "cmd /c echo \"%_PATH1%\@file --- Deprecated_%_dateX%_%_FILE1%\" && ren %_PATH1%\%_FILE1% Deprecated_%_datetimeX%_%_FILE1% " >> %_log%
echo -----------------------------
dir /b /s /a-d %_PATH1%\*%_FILE1%
pause
goto begin

:op2
echo you picked option 2 "Copy a file to path ..."
SET /P "_PATH1=Enter Path (C:\Users\%username%\Desktop\for ):
REM SET _PATH1=C:\Users\%username%\Desktop\for
SET /P "_FILE1=Enter Name File (maintenance_land.png ):
REM SET _FILE1=maintenance_land.png
FORFILES /P %_PATH2% /M %_FILE1% /C "cmd /c echo \"%_PATH2%\%_FILE1% --- %_PATH1%\" && copy %_PATH2%\%_FILE1% %_PATH1% /Y " >> %_log%
echo -----------------------------
dir /b /s /a-d %_PATH1%\*%_FILE1%
pause
goto begin

:op3
echo you picked option 3 "Change Deprecated_ to file ..."
SET /P "_PATH1=Enter Path (C:\Users\%username%\Desktop\for ):
cmd /k "cd %_PATH1% && dir /s /b /a:d "
SET /P "_FILE1=Enter Name File (maintenance_land.png ):
REM SET _FILE1=maintenance_land.png
FORFILES /P %_PATH1% /M *%_FILE1% /C "cmd /c echo \"%_PATH1%\@file --- %_FILE1%\" && ren %_PATH1%\@file %_FILE1% " >> %_log%
echo -----------------------------
dir /b /s /a-d %_PATH1%\*%_FILE1%
pause
goto begin

:op4
echo you picked option 4 "Edit script !!!"
set _PATH=C:\Scripts\%_namefile%
notepad %_PATH%
pause
goto begin

:exit
timeout 10
@exit