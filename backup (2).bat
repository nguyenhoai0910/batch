@echo off
if not exist C:\Users\%username%\Desktop\Trienkhai_%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2% mkdir C:\Users\%username%\Desktop\Trienkhai_%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%
start C:\Users\%username%\Desktop\Trienkhai_%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%
set _path_backup=D:\Website\_Backup
REM _sub1 is Site
set _sub1=%1
if "%_sub1%"=="" exit
set _path1=%_path_backup%\%_sub1%\
REM _sub2 is type (ID_RFC | hotfix)
set _sub2=_%2
if "%_sub2%"=="" exit
set _path2=%_path_backup%\%_sub1%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%_sub2%\
REM _sub3 is hashtag (api | web)
set _sub3=%3
set _path3=%_path_backup%\%_sub1%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%_sub2%\%_sub3%
if not exist %_path_backup%\%_sub1%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%_sub2%\%_sub3% mkdir %_path_backup%\%_sub1%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%_sub2%\%_sub3%
start %_path3%