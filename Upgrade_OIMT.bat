@ECHO OFF 
REM =========================================
REM PATH C:\Scripts\Upgrade_OIMT.bat
REM =========================================
SET _PATH0=C:\Users\%username%\Desktop\Trienkhai
IF NOT EXIST %_PATH0% MKDIR %_PATH0% & exit
IF EXIST "%_PATH0%\APIPUBLISH.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\APIPUBLISH.zip" -o"%_PATH0%\"
IF EXIST "%_PATH0%\Api.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\Api.zip" -o"%_PATH0%\"
IF EXIST "%_PATH0%\WEBNEW.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\WEBNEW.zip" -o"%_PATH0%\"
IF EXIST "%_PATH0%\Web.zip" "C:\Program Files\7-Zip\7z.exe" x  "%_PATH0%\Web.zip" -o"%_PATH0%\"

IF EXIST %_PATH0%\APIPUBLISH\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\APIPUBLISH > %_PATH0%\APIPUBLISH\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH\
		copy C:\Websites\CRM\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH\ /Y
		xcopy C:\Website\CRM C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\APIPUBLISH > %_PATH0%\APIPUBLISH\%1.txt
		DIR /b /a-d %_PATH0%\APIPUBLISH >> %_PATH0%\APIPUBLISH\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\APIPUBLISH\%1.txt") do ( more %_PATH0%\APIPUBLISH\%1.txt && xcopy C:\Websites\CRM\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\APIPUBLISH\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\APIPUBLISH\%1.txt") do ( more %_PATH0%\APIPUBLISH\%1.txt && xcopy %_PATH0%\APIPUBLISH\%a C:\Websites\CRM\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\Api\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\Api > %_PATH0%\Api\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api\
		copy C:\Websites\CRM\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api\ /Y
		xcopy C:\Website\CRM C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\Api > %_PATH0%\Api\%1.txt
		DIR /b /a-d %_PATH0%\Api >> %_PATH0%\Api\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Api\%1.txt") do ( more %_PATH0%\Api\%1.txt && xcopy C:\Websites\CRM\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Api\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Api\%1.txt") do ( more %_PATH0%\Api\%1.txt && xcopy %_PATH0%\Api\%a C:\Websites\CRM\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\WEBNEW\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\WEBNEW > %_PATH0%\WEBNEW\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW\
		copy C:\Websites\CRM\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW\ /Y
		xcopy C:\Website\CRM C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\WEBNEW > %_PATH0%\WEBNEW\%1.txt
		DIR /b /a-d %_PATH0%\WEBNEW >> %_PATH0%\WEBNEW\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\WEBNEW\%1.txt") do ( more %_PATH0%\WEBNEW\%1.txt && xcopy C:\Websites\CRM\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\WEBNEW\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\WEBNEW\%1.txt") do ( more %_PATH0%\WEBNEW\%1.txt && xcopy %_PATH0%\WEBNEW\%a C:\Websites\CRM\%a /E /H /C /I /Y ) 
)
IF EXIST %_PATH0%\Web\ 
(
	IF NOT EXIST C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web MKDIR C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web
	IF "%1"=="rfc"
	(
		DIR /B /AD %_PATH0%\Web > %_PATH0%\Web\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web\
		copy C:\Websites\CRM\* C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web\ /Y
		xcopy C:\Website\CRM C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web\ /E /H /C /I /Y
	)
	IF "%1"=="hotfix"
	(
		DIR /B /AD %_PATH0%\Web > %_PATH0%\Web\%1.txt
		DIR /b /a-d %_PATH0%\Web >> %_PATH0%\Web\%1.txt
		echo C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web\
		for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Web\%1.txt") do ( more %_PATH0%\Web\%1.txt && xcopy C:\Websites\CRM\%a C:\Website\_Backup\%date:~10%%date:~4,2%%date:~7,2%-%1\Web\%a /E /H /C /I /Y ) 
	)
	REM Trienkhai
	for /f "usebackq tokens=1 delims=," %a in ("%_PATH0%\Web\%1.txt") do ( more %_PATH0%\Web\%1.txt && xcopy %_PATH0%\Web\%a C:\Websites\CRM\%a /E /H /C /I /Y ) 
)
ECHO Stop IIS
iisreset /STOP
ECHO Start IIS
iisreset /START
ECHO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO Completed %_PATH0%!
PAUSE