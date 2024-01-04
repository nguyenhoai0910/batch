@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM Name: C:\Scripts\export_excel_oimt.bat
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM ======================================================
Setlocal
set _path=C:\Users\%username%\Desktop\
REM set _path1=C:\OMIT\OIMT_API\WebApi\ExportExcel
set _path1=C:\OMIT\APIPUBLISH\ExportExcel
set _path2=%_path%\Excel
if not exist %_path2% mkdir %_path2%
if not exist %_path%\input.txt echo #1001_20220801_00114.xls >%_path%\input.txt & exit
FOR /F "tokens=* delims=" %%x in (%_path%\input.txt) DO (copy %_path1%\%%x "%_path2%")
"C:\Program Files\7-Zip\7z.exe" a %_path%\excel.zip %_path2% 2> nul 
del %_path2% & rmdir %_path2%
exit