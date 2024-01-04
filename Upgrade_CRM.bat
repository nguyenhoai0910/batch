@ECHO OFF 
REM =========================================
REM PATH C:\Scripts\Upgrade_CRM.bat
REM =========================================
SET _PATH0=C:\Users\%username%\Desktop\Trienkhai
IF NOT EXIST %_PATH0% MKDIR %_PATH0% & exit
IF EXIST "%_PATH0%\Source.7z" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\Source.7z" -o"%_PATH0%\"
IF EXIST "%_PATH0%\CRM_NodeJs.7z" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\CRM_NodeJs.7z" -o"%_PATH0%\"

IF EXIST %_PATH0%\Source\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\Source > %_PATH0%\Source\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source\
		copy C:\Websites\CRM\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source\ /Y
		xcopy C:\Website\CRM C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\Source > %_PATH0%\Source\%1.txt
		DIR /b /a-d %_PATH0%\Source >> %_PATH0%\Source\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Source\%1.txt") do ( more %_PATH0%\Source\%1.txt && xcopy C:\Websites\CRM\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Source\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Source\%1.txt") do ( more %_PATH0%\Source\%1.txt && xcopy %_PATH0%\Source\%a C:\Websites\CRM\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\CRM_NodeJs
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\CRM_NodeJs > %_PATH0%\CRM_NodeJs\%1.txt
		DIR /b /a-d %_PATH0%\CRM_NodeJs >> %_PATH0%\CRM_NodeJs\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs\
		copy C:\CRMService\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs\ /Y
		xcopy C:\CRMService C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\CRM_NodeJs > %_PATH0%\CRM_NodeJs\%1.txt
		DIR /b /a-d %_PATH0%\CRM_NodeJs >> %_PATH0%\CRM_NodeJs\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\CRM_NodeJs\%1.txt") do ( more %_PATH0%\CRM_NodeJs\%1.txt && xcopy C:\CRMService\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\CRM_NodeJs\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\CRM_NodeJs\%1.txt") do ( more %_PATH0%\CRM_NodeJs\%1.txt && xcopy %_PATH0%\CRM_NodeJs\%a C:\CRMService\%a /E /H /C /I /Y ) 
	C:
	cd C:\CRMService
	C:\Windows\System32\cmd.exe /C pm2 kill
	C:\Windows\System32\cmd.exe /C pm2 start C:\CRMService\app.js
	if not exist "LogsCRMService" mkdir "LogsCRMService"
	echo "%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME% - check" >> C:\CRMService\LogsCRMService\%date:~10%%date:~4,2%%date:~7,2%
	C:\Windows\System32\cmd.exe /C pm2 status 0 >> C:\CRMService\LogsCRMService\%date:~10%%date:~4,2%%date:~7,2%	
)
ECHO Stop IIS
iisreset /STOP
ECHO Start IIS
iisreset /START
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO Completed !
PAUSE