@echo off
REM auto start ecosystem.config.js when reboot.
set _today=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME%
set _path_log="D:\Website\website-public\LogsOCBService\%date:~10%%date:~4,2%%date:~7,2%.log"
set _path0=D:\Website\website-public

set _CreateDir=%_path0%\LogsOCBService 
(for %%a in (%_CreateDir%) do ( 
   if not exist %%a mkdir %%a
))

echo %_today% >> %_path_log%
echo pm2 kill !!! >> %_path_log%
C:\Windows\System32\cmd.exe /C pm2 kill
echo iisreset !!! >> %_path_log%
C:\Windows\System32\cmd.exe /C iisreset
echo pm2 start ecosystem.config.js !!! >> %_path_log%
d: & cd D:\Website\website-public\
C:\Windows\System32\cmd.exe /C pm2 start D:\Website\website-public\ecosystem.config.js
timeout 5 > nul
C:\Windows\System32\cmd.exe /C pm2 status D:\Website\website-public\ecosystem.config.js >> %_path_log%
c:
echo success !!!
echo ================================================================================================== >> %_path_log%
