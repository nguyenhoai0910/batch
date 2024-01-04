@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM Name: C:\Scripts\export_excel_oimt.bat
set _namefile=export_excel_oimt.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
@set/a Yest=%DATE:~7,2%-1
if %Yest% LSS 10 (set Yest=0%Yest%)
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
Setlocal
set _path=C:\Users\%username%\Desktop
set _7Zip="C:\Program Files\7-Zip\7z.exe"
REM set _path1=C:\OMIT\OIMT_API\WebApi\ExportExcel
set _path1=C:\OMIT\APIPUBLISH\ExportExcel
set _path2=%_path%\Excel
REM ======================================================
echo %_dateX%_%_timeX%
if not exist %_path2% mkdir %_path2%
if not exist %_path%\input.txt echo #1001_20220801_00114.xls >%_path%\input.txt & exit
FOR /F "tokens=* delims=" %%x in (%_path%\input.txt) DO (copy %_path1%\%%x "%_path2%" >> %_log%)
%_7Zip% a %_path%\excel.zip %_path2% 2> nul 
del %_path2% & rmdir %_path2%
type %_log%
exit