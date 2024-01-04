REM @ECHO off
REM Variables: C:\Users\%username%\Desktop
REM PATH: C:\Scripts\upload.bat
set _namefile=upload-group-file.bat
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _PATH0=C:\Users\%username%\Desktop

set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
set _zip="C:\Program Files\7-Zip\7z.exe"
set _unzip=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT)
REM ECHO --------------BEGIN-%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~2,3%-------------- 
REM FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x.zip %_zip% x -oC:\Users\%username%\Desktop C:\Users\%username%\Desktop\%%x.zip) >> %_log%
REM FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x DIR /a /b /s C:\Users\%username%\Desktop\%%x)
REM ECHO ---------------------------- >> %_log%
REM FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x echo C:\Users\%username%\Desktop\%%x) >> %_log%

REM SET _SUB1=https://ocb.com.vn/uploads/cdn/mobile
REM SET _SUB1=%_SUB1:https://www.ocb.com.vn/uploads/=\%
REM SET _SUB1=%_SUB1:https://ocb.com.vn/uploads/=\%
REM SET _SUB1=%_SUB1:/=\%
REM SET _PATH0=%_SUB1%
REM echo %_PATH0%
REM SET _PATH1=C:\Users\%username%\Desktop
REM SET _PATH2=Website\website-public\dist\ocb-fe\browser\Uploads%_PATH0%
REM ECHO %_PATH2%
REM SET /P "qiz=Enter Upload (Y|N):
REM IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT)
IF not exist %_PATH0%\upload-group-file.txt echo endpath file1 file2 file3 file4 file5 file6 file7 file8 file9 > %_PATH0%\upload-group-file.txt 
for /f "usebackq tokens=1-10 delims=" %%a in (%_PATH0%\upload-group-file.txt) do ( 
REM echo %%a %%b %%c %%d %%e %%f %%g %%h %%i %%j 
if not "%%a"=="" (echo %%a)
if not "%%b"=="" (echo %%b)
if not "%%c"=="" (echo %%c)
if not "%%d"=="" (echo %%d)
if not "%%e"=="" (echo %%e)
if not "%%f"=="" (echo %%f)
if not "%%g"=="" (echo %%g)
if not "%%h"=="" (echo %%h)
if not "%%j"=="" (echo %%j)  )
REM ECHO --------------%_namefile%_%date:~10%date:~4,2%date:~7,2%_%time:~0,2%time:~2,3%-------------- >> %_log%
REM pushd \\10.102.20.10\D$
REM set _namefile=upload.bat
REM set _log=C:\Scripts-logs\%_namefile%_%date:~10%date:~4,2%date:~7,2%.log
REM ECHO \\10.102.20.10\D$ >> %_log%
REM FOR %x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%x xcopy %_PATH1%\%x %_PATH2%\%x /E /H /C /I /Y /F) >> %_log%
REM popd \\10.102.20.10\D$
REM pushd \\10.102.84.10\D$
REM set _namefile=upload.bat
REM set _log=C:\Scripts-logs\%_namefile%_%date:~10%date:~4,2%date:~7,2%.log
REM ECHO \\10.102.84.10\D$ >> %_log%
REM FOR %x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%x xcopy %_PATH1%\%x %_PATH2%\%x /E /H /C /I /Y /F) >> %_log%
REM popd \\10.102.84.10\D$
REM ECHO --------------DONE-%date:~10%date:~4,2%date:~7,2%_%time:~0,2%time:~2,3%-------------- >> %_log%
type %_log%
IF not exist %_PATH0%\upload-group-file.txt ren %_PATH0%\upload-group-file.txt upload-group-file.txt_%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~2,3%
pause
GOTO:EOF