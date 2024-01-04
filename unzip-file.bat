@echo off
set input=DC_WebOCB
set site=Backend
REM ================================================================
copy "logs%date:~10%%date:~4,2%%date:~7,2%.txt" "logs%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.temp.txt" 
tar.exe --exclude="logs%date:~10%%date:~4,2%%date:~7,2%.txt delete-file.log" -acf "%input%_%date:~10%%date:~4,2%%date:~7,2%_%site%_%time:~0,2%%time:~3,2%%time:~6,2%.zip" "logs*" 2> nul
timeout 1 > nul
del *.temp.txt 2> nul
REM ================================================================
set /P "qiz=Enter Delete File (Y|N):
if %qiz%==Y ForFiles /p "D:\Website\FileBuildBackEnd\Logs" /s /d -7 /c "cmd /c del @file & echo @file >> delete-file.log" | echo "%input%_%date:~10%%date:~4,2%%date:~7,2%_%site%_%time:~0,2%%time:~3,2%%time:~6,2%.zip" >> delete-file.log
goto:eof