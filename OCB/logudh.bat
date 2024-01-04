@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\logudh.bat
REM LOG: >> C:\Scripts-logs\upload.bat_%date:~10%%date:~4,2%%date:~7,2%.log
set _namefile=upload.bat
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
SET _PATH1=Website\UDHHopDongKySo\Logs
SET _PATH2=C:\Users\%username%\Desktop\udh
REM set _day=01/10/2023(mm/dd/yyyy)
set _day=01/10/2023
REM FORFILES -p "Website\UDHHopDongKySo\Logs" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
REM FORFILES -p "Website\UDHHopDongKySo\Logs" /S /M *.txt -d +%_day% /C "cmd /c copy @file C:\Users\%username%\Desktop\udh & ren C:\Users\%username%\Desktop\udh\@file Az1_@file"
set /p _day="day (mm/dd/yyyy|01/10/2023): "
echo %_day%
if not exist %_PATH2% mkdir %_PATH2%
pushd \\10.102.20.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file Az1_@file"
popd \\10.102.20.10\D$
pushd \\10.102.84.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file Az2_@file"
popd \\10.102.84.10\D$
"C:\Program Files\7-Zip\7z.exe" a C:\Users\%username%\Desktop\logudh.zip %_PATH2%
del %_PATH2% && rmdir %_PATH2%
pause
GOTO:EOF