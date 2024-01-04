REM @ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_BONew.bat
REM E:\BACKUP_LAPTOP\20230731\Quitrinh\batch\swift\ren_swift.bat
set _namefile=ren_swift.bat
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
set _log_done=C:\Scripts-logs\%_namefile%_done_%_datetimeX%.log
REM ======================================================
set _PATH0=E:\DIENVAOT24
set _PATH1=E:\DIENVAOT24\renfile
set _PATH2=E:\DIENVAOT24\temp
set _PATH3=E:\DIENDAVAOT24
REM set _PATH4=Y:\
set _PATH4=E:\T24
set _CreateDir=%_PATH0% %_PATH1% %_PATH2% %_PATH3% %_PATH4%
(for %%a in (%_CreateDir%) do (if not exist %%a mkdir %%a ))
REM ======================================================
MOVE /Y E:\DIENVAOT24\*.* %_PATH1%
FORFILES /p %_PATH1% /C "cmd /c ren %_PATH1%\@file %_datetimeX%_@file && MOVE /Y %_PATH1%\%_datetimeX%_@file %_PATH2%" >> %_log%
copy /A %_PATH2%\*.* %_PATH4%
MOVE /Y %_PATH2%\*.* %_PATH3% >> %_log_done% 