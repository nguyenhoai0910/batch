@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\rfc-PQTT.bat
REM LOG: >> C:\Scripts-log\rfc-PQTT.bat_%date:~10%%date:~4,2%%date:~7,2%.log
if not exist C:\Scripts-log mkdir C:\Scripts-log
call :main >> C:\Scripts-log\rfc-PQTT.bat_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
:main
SET _PATH0=C:\Website\_Backup\PhanQuyenTapTrung\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\
SET _PATH1=C:\Users\%username%\Desktop\Trienkhai
SET _PATH2=C:\Users\%username%\Desktop\Trienkhai\PQTT
SET _PATH5=C:\Website\PQTT
set _sub1=rfc
set _date=%date:~10,4%%date:~4,2%%date:~7,2%

IF NOT EXIST C:\Users\%username%\Desktop\Trienkhai MKDIR C:\Users\%username%\Desktop\Trienkhai & exit
if exist "C:\Users\%username%\Desktop\Trienkhai\App phan quyen.zip" ren "C:\Users\%username%\Desktop\Trienkhai\App phan quyen.zip" PQTT.zip
if exist "C:\Users\%username%\Desktop\Trienkhai\PQTT.zip" "C:\Program Files\7-Zip\7z.exe" x -o"C:\Users\ocboper\Desktop\Trienkhai\PQTT" "C:\Users\%username%\Desktop\Trienkhai\PQTT.zip"
IF NOT EXIST C:\Website\_Backup\PhanQuyenTapTrung\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ MKDIR C:\Website\_Backup\PhanQuyenTapTrung\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\
IF "%_sub1%"=="rfc" DIR /B /A  /S C:\Users\%username%\Desktop\Trienkhai\PQTT > C:\Users\%username%\Desktop\Trienkhai\PQTT-%_sub1%.txt & copy C:\Website\PQTT\* C:\Website\_Backup\PhanQuyenTapTrung\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ /Y &  xcopy C:\Website\PQTT C:\Website\_Backup\PhanQuyenTapTrung\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ /E /H /C /I /Y 

REM ECHO List IIS
%windir%\system32\inetsrv\appcmd list site
REM ECHO Stop IIS
%windir%\system32\inetsrv\appcmd stop site PQTT
REM REM Trienkhai
IF "%_sub1%"=="rfc" copy C:\Users\%username%\Desktop\Trienkhai\PQTT C:\Website\PQTT\* /Y &  xcopy C:\Users\%username%\Desktop\Trienkhai\PQTT C:\Website\PQTT /E /H /C /I /Y 
REM ECHO Start IIS
%windir%\system32\inetsrv\appcmd start site PQTT
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO Completed !
PAUSE