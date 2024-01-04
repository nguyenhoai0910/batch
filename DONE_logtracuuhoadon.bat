@echo off
REM name: C:\Scripts\logudh.bat
SET _PATH1=Website\TraCuuHoaDon\Logs
SET _PATH2=C:\Users\%username%\Desktop\tracuuhoadon
set /p _day="day (mm/dd/yyyy|01/10/2023): "
echo %_day%
if not exist %_PATH2% mkdir %_PATH2%
REM set _day=01/10/2023(mm/dd/yyyy)
REM set _day=01/10/2023
REM FORFILES -p "D:\Website\TraCuuHoaDon\Logs" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
REM FORFILES -p "D:\Website\TraCuuHoaDon\Logs" /S /M *.txt -d +%_day% /C "cmd /c copy @file C:\Users\%username%\Desktop\tracuuhoadon & ren C:\Users\%username%\Desktop\tracuuhoadon\@file DC_@file"
pushd \\10.102.20.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file DC_@file"
popd \\10.102.20.10\D$
pushd \\10.102.84.10\D$
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c echo @file"
FORFILES -p "%_PATH1%" /S /M *.txt -d +%_day% /C "cmd /c copy @file %_PATH2% & ren %_PATH2%\@file DR_@file"
popd \\10.102.84.10\D$
REM cd C:\Users\%username%\Desktop\
"C:\Program Files\7-Zip\7z.exe" a C:\Users\%username%\Desktop\logtracuuhoadon.zip %_PATH2%
del %_PATH2% && rmdir %_PATH2%
pause
exit