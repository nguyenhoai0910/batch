@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH C:\Scripts\rfc_FO-Report.bat
set _namefile=rfc_FO-Report.bat
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%_dateX%.log
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM =======================================
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
REM =======================================
IF EXIST C:\Users\%username%\Desktop\Trienkhai MKDIR C:\Users\%username%\Desktop\Trienkhai
set _7zip="C:\Program Files\7-Zip\7z.exe"
set _PATH0=E:\_Backup\FO-Report\%_dateX%_%_timeX%
set _PATH1=D:\Website\FO-Report
set _PATH2=C:\Users\%username%\Desktop\Trienkhai\FO-Report
ECHO ==========BEGIN %_dateX%_%_timeX% ========== >> %_log%
REM Backup
FOR %%x IN (FO-Report) DO (IF EXIST C:\Users\%username%\Desktop\%%x.zip %_7zip% x -oC:\Users\%username%\Desktop\Trienkhai\%%x C:\Users\%username%\Desktop\%%x.zip) >> %_log%
DIR /B /A /S C:\Users\%username%\Desktop\Trienkhai\FO-Report > C:\Users\%username%\Desktop\Trienkhai\FO-Report.txt
if not exist %_PATH0% mkdir %_PATH0%
set _CreateDir=bin Areas\BanCheoKHCNDN Areas\BaoCaoBHTG Areas\BaoCaoCIFChuaCoFile Areas\BaoCaoCRM Areas\BaoCaoDongTienKHDN Areas\BaoCaoTKSDOmni Areas\BCNHNN Areas\CITAD Areas\ConfirmBalance Areas\CustomerOnBoarding Areas\DOI_SOAT_EVN Areas\E_BANKING Areas\ExportVAT Areas\ExportVAT_DONVI Areas\ForFOWeb Areas\General Areas\GiaoDichKhongButToan Areas\KMHE Areas\LaiThauChiKHDN Areas\Loyalty Areas\PCRT Areas\ReportOrther Areas\Salary3P Areas\SmartCard Areas\SmartLink Areas\SMEDaily Areas\ThuPhiDHBK Areas\VCLI Content\images Content\themes Scripts\2011.2.712 Temp\admin Temp\BCBHTG Temp\BCCRM tools\Crystal tools\XacNhanSoDu Views\Home Views\Shared
FOR %%x IN (%_CreateDir%) DO (IF EXIST %_PATH2%\%%x xcopy %_PATH1%\%%x %_PATH0%\%%x /E /H /C /I /Y /F) >> %_log%
type %_log%

REM Trien khai
SET /P "qiz=Enter Golive (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
FOR %%x IN (%_CreateDir%) DO (IF EXIST %_PATH2%\%%x xcopy %_PATH2%\%%x %_PATH1%\%%x /D /E /H /C /I /Y /F) >> %_log%
type %_log%
REN %_PATH2% FO-Report_%_dateX%_%_timeX%
ECHO Complete !!!
ECHO ==========DONE %_dateX%_%_timeX% ========== >> %_log%
type %_log%
