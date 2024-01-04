@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\%_namefile%
set _namefile=export-eKYC.bat
set _dateX=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set _timeX=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set _dateX=%_dateX: =0%
set _timeX=%_timeX: =0%
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
if not exist C:\Users\%username%\Desktop\input.txt echo #7405956,2021/10/08/615fe76ce83b52bc309e0212bb1d71bf,2021/10/08/615fe76ce83b52bc309e0212bb1d71bf/portrait/20211008_134259_portrait_1633675492640.jpeg,2021/10/08/615fe76ce83b52bc309e0212bb1d71bf/id_card.vn.national_id.back/20211008_134056_id_card_back_1633675370924.jpeg,2021/10/08/615fe76ce83b52bc309e0212bb1d71bf/id_card.vn.national_id.front/20211008_134037_id_card_front_1633675351935.jpeg > C:\Users\%username%\Desktop\input.txt  & timeout 5 & exit
set _7Zip="C:\Program Files\7-Zip\7z.exe"
set _log=C:\Scripts-logs\%_namefile%_%_dateX%_%_timeX%.log
REM ======================================================
SET _PATH0=C:\Users\%username%\Downloads\export_%_dateX%
F:
cd F:\trulyonline\onboarding_customer
for /f "usebackq tokens=1-5 delims=," %%a in ("C:\Users\%username%\Desktop\input.txt") do ( 
echo %%a %%b %%c %%d %%e >> %_log%
if not exist "%_PATH0%\%%a" mkdir "%_PATH0%\%%a" 
XCOPY %%b "%_PATH0%\%%a" /E /H /C /I /Y /F >> %_log%
if %%b =="" (xcopy "%%c" "%_PATH0%\%%a" /H /C /I /Y /F >> %_log%)
if %%b =="" (xcopy "%%d" "%_PATH0%\%%a" /H /C /I /Y /F >> %_log%)
if %%b =="" (xcopy "%%e" "%_PATH0%\%%a" /H /C /I /Y /F >> %_log%) ) 
SET /P "pas=Enter Password: "
IF /I "%pas%"=="" (SET pas=%date:~10%%date:~4,2%%date:~7,2%) 
echo OCB%pas% >> %_log%
%_7Zip% a -pOCB%pas% -sdel C:\Users\%username%\Downloads\export_%_dateX%.7z C:\Users\%username%\Downloads\export_%_dateX% >> %_log%
type %_log%
echo complete!!!
pause
