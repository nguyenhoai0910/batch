@echo off
REM name: C:\Scripts\logudh.bat
SET _PATH1=Website\UDHHopDongKySo\Logs
SET _PATH2=C:\Users\%username%\Desktop\udh
REM set _day=01/10/2023(mm/dd/yyyy)
set _day=01/10/2023
REM FORFILES -p "Website\UDHHopDongKySo\Logs" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
REM FORFILES -p "Website\UDHHopDongKySo\Logs" /S /M *.txt -d +%_day% /C "cmd /c copy @file C:\Users\%username%\Desktop\udh & ren C:\Users\%username%\Desktop\udh\@file DC_@file"
set /p _day="day (mm/dd/yyyy|01/10/2023): "
echo %_day%
if not exist %_PATH2% mkdir %_PATH2%
pushd \\10.102.20.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file DC_@file"
popd \\10.102.20.10\D$
pushd \\10.102.84.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file DC_@file"
popd \\10.102.84.10\D$
"C:\Program Files\7-Zip\7z.exe" a C:\Users\%username%\Desktop\logudh.zip %_PATH2%
del %_PATH2% && rmdir %_PATH2%
pause
exit