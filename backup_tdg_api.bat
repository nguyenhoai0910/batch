set _today=%date:~10%%date:~4,2%%date:~7,2%
set _path_backup=D:\Website\_Backup
set _sub=%1
if not exist %_path_backup%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%_%_sub% mkdir %_path_backup%\%date:~10%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%_%_sub%\AppTDG