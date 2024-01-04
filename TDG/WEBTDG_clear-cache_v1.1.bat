@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
REM ======================================================
REM today funtion
set _namefile=clear-cache.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
echo %_namefile%_%_dateX%_%_timeX%
REM ======================================================
REM yesterday funtion
@set a=1
@set b=10
@set/a Yest=%DATE:~7,2%-%a%
if %Yest% LSS %b% (set Yest=0%Yest%)
set _YesterdayX=%DATE:~10,4%%DATE:~4,2%%Yest%
echo %_YesterdayX%
REM ======================================================
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _dir_ar=C:\Scripts-logs\archived
set _createdir=%_dir_temp% %_dir_ar%
(for %%a in (%_createdir%) do (if not exist %%a mkdir %%a ))
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%.log
set _Ylog=C:\Scripts-logs\%_namefile%_%_YesterdayX%.log
REM ======================================================
ECHO ----%_namefile%_%_dateX%_%_timeX%---- >> %_log%
D: && cd D:\Website\WebTDG\Cache
del /S /Q /F D:\Website\WebTDG\Cache >> %_log%
move %_Ylog% %_dir_ar%

echo %_log% & type %_log%
ECHO ====================================================================================
ECHO Completed !
ECHO --------------DONE-%_namefile%_%_dateX%_%_timeX%--------------
timeout 15