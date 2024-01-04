@ECHO OFF 
REM =========================================
REM PATH C:\Scripts\Upgrade_SBV.bat
REM =========================================
SET _PATH0=C:\Users\%username%\Desktop\Trienkhai
IF NOT EXIST %_PATH0% MKDIR %_PATH0% & exit
IF EXIST "%_PATH0%\SBVAPI.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\SBVAPI.zip" -o"%_PATH0%\"
IF EXIST "%_PATH0%\SBVWeb.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\SBVWeb.zip" -o"%_PATH0%\"
IF EXIST "%_PATH0%\autoservice.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\autoservice.zip" -o"%_PATH0%\"

IF EXIST %_PATH0%\SBVAPI\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\SBVAPI > %_PATH0%\SBVAPI\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI\
		copy C:\Website\SBVAPI\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI\ /Y
		xcopy C:\Website\SBVAPI C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\SBVAPI > %_PATH0%\SBVAPI\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\SBVAPI\%1.txt") do ( more %_PATH0%\SBVAPI\%1.txt && xcopy C:\Website\SBVAPI\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVAPI\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\SBVAPI\%1.txt") do ( more %_PATH0%\SBVAPI\%1.txt && xcopy %_PATH0%\SBVAPI\%a C:\Website\SBVAPI\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\SBVWeb
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\SBVWeb > %_PATH0%\SBVWeb\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb\
		copy C:\Website\SBVWeb\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb\ /Y
		xcopy C:\Website\SBVWeb C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\SBVWeb > %_PATH0%\SBVWeb\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\SBVWeb\%1.txt") do ( more %_PATH0%\SBVWeb\%1.txt && xcopy C:\Website\SBVWeb\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\SBVWeb\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\SBVWeb\%1.txt") do ( more %_PATH0%\SBVWeb\%1.txt && xcopy %_PATH0%\SBVWeb\%a C:\Website\SBVWeb\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\autoservice
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\autoservice MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\autoservice
	xcopy C:\Winservice\autoservice C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\autoservice\ /E /H /C /I /Y
	sc stop "ServiceRun"
	CD C:\Winservice\autoservice
	InstallUtil.exe -u AutoService.exe
	REM Trienkhai
	xcopy %_PATH0%\autoservice C:\Winservice\autoservice /E /H /C /I /Y
	CD C:\Winservice\autoservice
	InstallUtil.exe -i AutoService.exe
	sc config "ServiceRun" start=delayed-auto
	sc start "ServiceRun"
)
ECHO Stop IIS
iisreset /STOP
ECHO Start IIS
iisreset /START
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO Completed !
PAUSE