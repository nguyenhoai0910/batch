@ECHO OFF 
REM =========================================
REM PATH C:\Scripts\rfc_BONew.bat
REM =========================================
SET _PATH0=C:\Website\_Backup\BONEW
SET _PATH1=C:\Users\%username%\Desktop\Trienkhai
SET _PATH2=C:\Users\%username%\Desktop\Trienkhai\BONEW
SET _PATH5=C:\Website\OCBBO
set _sub1=rfc
set _date=%date:~10,4%%date:~4,2%%date:~7,2%

IF NOT EXIST C:\Users\%username%\Desktop\Trienkhai MKDIR C:\Users\%username%\Desktop\Trienkhai & exit
if exist "C:\Users\%username%\Desktop\Trienkhai\OCBBO.zip" "C:\Program Files\7-Zip\7z.exe" x -o"C:\Users\ocboper\Desktop\Trienkhai\" "C:\Users\%username%\Desktop\Trienkhai\OCBBO.zip"
IF NOT EXIST C:\Website\_Backup\BONEW\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ MKDIR C:\Website\_Backup\BONEW\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\
IF "%_sub1%"=="rfc" DIR /B /A  /S C:\Users\%username%\Desktop\Trienkhai\OCBBO > C:\Users\%username%\Desktop\Trienkhai\OCBBO-%_sub1%.txt & copy C:\Website\OCBBO\* C:\Website\_Backup\BONEW\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ /Y &  xcopy C:\Website\OCBBO C:\Website\_Backup\BONEW\%date:~10,4%%date:~4,2%%date:~7,2%-%_sub1%\ /E /H /C /I /Y 

REM ECHO List IIS
%windir%\system32\inetsrv\appcmd list site
REM ECHO Stop IIS
%windir%\system32\inetsrv\appcmd stop site "bo.ocb.vn"
REM REM Trienkhai
IF "%_sub1%"=="rfc" copy C:\Users\%username%\Desktop\Trienkhai\OCBBO C:\Website\OCBBO\* /Y &  xcopy C:\Users\%username%\Desktop\Trienkhai\OCBBO C:\Website\OCBBO\  /E /H /C /I /Y 
REM ECHO Start IIS
%windir%\system32\inetsrv\appcmd start site "bo.ocb.vn"
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO Completed !
PAUSE