@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=SyncZoneWebOCB.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
set _logunzip=C:\Scripts-logs\unzip_%_namefile%_%_dateX%_%_timeX%.log
REM ================================================================================
echo Resource_DC_to_DR
SET Today=%Date:~10,4%-%Date:~4,2%-%Date:~7,2%
SET _source=\\10.102.20.10\D$\Website\FileBuildBackEnd\Resources
SET _dest=\\localhost\D$\Website\FileBuildBackEnd\Resources
SET _options=/S /XA:SH /W:5 /copy:DT /xf Web.config /log+:%_log%
::/s 	Copies subdirectories. This option automatically excludes empty directories.
::/xa:sh	Excludes files for which any of the specified attributes are set. (S - System; H - Hidden)
::/w:5	Specifies the wait time between retries, in 5 seconds.
::/copy:dt	Specifies which file properties to copy (D - Data; T - Time stamps).
::/xf <filename> : Excludes files that match the specified names or paths. Supports wildcard characters (* and ?).
::/log+:<logfile> 	Writes the status output to the log file (appends the output to the existing log file).
robocopy %_source% %_dest% %_options%
:: start C:\robo_backup_log.txt
:: pause