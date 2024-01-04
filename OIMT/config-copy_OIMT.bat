@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM Name: C:\Scripts\config-copy_OIMT.bat
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM ======================================================
SET _PATH=C:\Users\%username%\Desktop
SET _PATH1=C:\OMIT\
if not exist %_PATH%\APIPUBLISH\ mkdir %_PATH%\APIPUBLISH\
if not exist %_PATH%\WEBNEW\ mkdir %_PATH%\WEBNEW\

copy %_PATH1%APIPUBLISH\Web.config %_PATH%\APIPUBLISH\ /Y
copy %_PATH1%WEBNEW\Web.config %_PATH%\WEBNEW\ /Y
"C:\Program Files\7-Zip\7z.exe" a %_PATH%\config.zip %_PATH%\APIPUBLISH\ %_PATH%\WEBNEW\