REM @author: http://lyminhhoang.com
REM @creator: nguyenhoai.net
@echo off
 
CLS
 
REM Specified Attachment Path to Backup
SET attachmentFolder="C:\Users\Hoai\Ubiquiti UniFi"
REM Destination Path to Save ZIP File
SET backupFolderPath="E:\NguyenHoai\My Job"
 
REM Specified path of 7Zip executable file (7z.exe)
SET zipExePath="C:\Program Files\WinRAR\WinRAR.exe"
 
REM Format datetime (use to
set timestamp=%DATE:/=-%-%TIME::=-%
set timestamp=%timestamp: =%
 
::set folderbk=%DATE:/=-%
::set folderbk=%folderbk: =%
set folderbk="Ubiquiti UniFi"

 
REM create backup folder
MD %backupFolderPath%\%folderbk%
 
echo Archiving Attachment folder...
echo - Source: %attachmentFolder%
echo - Desination: '%backupFolderPath%\%folderbk%\backup_%timestamp%.zip'
 
REM Zip Attachment Folder
%zipExePath% a %backupFolderPath%\%folderbk%\backup_%timestamp%.zip %attachmentFolder%
forfiles /p "E:\NguyenHoai\My Job\Ubiquiti UniFi" /s /m *.zip /c "cmd /c Del @path" /d -1
echo Archive Attachment Completed!
pause
REM exit
exit