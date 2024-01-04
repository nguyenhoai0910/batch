@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\upload.bat
REM LOG: >> C:\Scripts-logs\upload.bat_%date:~10%%date:~4,2%%date:~7,2%.log
set _namefile=upload.bat
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT)
ECHO --------------BEGIN-%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~2,3%-------------- 
FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x.zip "C:\Program Files\7-Zip\7z.exe" x -oC:\Users\%username%\Desktop C:\Users\%username%\Desktop\%%x.zip) >> %_log%
FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x DIR /a /b /s C:\Users\%username%\Desktop\%%x)
ECHO ---------------------------- >> %_log%
FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x echo C:\Users\%username%\Desktop\%%x) >> %_log%

REM SET _PATH0=https://ocb.com.vn/uploads/cdn/mobile/
SET _SUB1=https://ocb.com.vn/uploads/cdn/mobile
SET _SUB1=%_SUB1:https://www.ocb.com.vn/uploads/=\%
SET _SUB1=%_SUB1:https://ocb.com.vn/uploads/=\%
SET _SUB1=%_SUB1:/=\%
SET _PATH0=%_SUB1%
echo %_PATH0%
SET _PATH1=C:\Users\%username%\Desktop
SET _PATH2=Website\website-public\dist\ocb-fe\browser\Uploads%_PATH0%
ECHO %_PATH2%
SET /P "qiz=Enter Upload (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 && EXIT)
ECHO --------------%_namefile%_%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~2,3%-------------- >> %_log%
pushd \\10.102.20.10\D$
set _namefile=upload.bat
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
ECHO \\10.102.20.10\D$ >> %_log%
FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x xcopy %_PATH1%\%%x %_PATH2%\%%x /E /H /C /I /Y /F) >> %_log%
popd \\10.102.20.10\D$
pushd \\10.102.84.10\D$
set _namefile=upload.bat
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
ECHO \\10.102.84.10\D$ >> %_log%
FOR %%x IN (banner appinit bg icons provider) DO (IF EXIST C:\Users\%username%\Desktop\%%x xcopy %_PATH1%\%%x %_PATH2%\%%x /E /H /C /I /Y /F) >> %_log%
popd \\10.102.84.10\D$
ECHO --------------DONE-%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~2,3%-------------- >> %_log%
GOTO:EOF