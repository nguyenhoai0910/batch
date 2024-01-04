@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM Name: C:\Scripts\export_img_cif.bat
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
REM ======================================================
F:
cd F:\trulyonline\onboarding_customer
if not exist "test_csv.txt" echo "%a %b %c %d %e > test_csv.txt
for /f "usebackq tokens=1-5 delims=," %a in ("test_csv.txt") do ( echo %a %b %c %d %e && if not exist "test/%a" mkdir "test/%a" && copy "%c" "test/%a/" && copy "%d" "test/%a/" && copy "%e" "test/%a/" ) 
pause

@echo off
_input=C:\Users\%username%\Desktop\input.txt

mkdir C:\Users\%username%\Downloads\export_%date:~10%%date:~4,2%%date:~7,2%
cd C:\Users\%username%\Downloads\export_%date:~10%%date:~4,2%%date:~7,2%
if not exist C:\Users\%username%\Downloads\export_20221215\8299550\ mkdir C:\Users\%username%\Downloads\export_20221215\8299550\
if not exist %_input% echo "REM %a:CIF | %b:# | %c:image | %d:image | %e:image" > %_input%

F:
cd F:\trulyonline\onboarding_customer
REM %a:CIF | %b:# | %c:image | %d:%c:image | %e:%c:image
for /f "usebackq tokens=1-5 delims=," %a in ("%_input%") do ( echo %a %b %c %d %e && if not exist "test/%a" mkdir "test/%a" && copy "%c" "test/%a/" && copy "%d" "test/%a/" && copy "%e" "test/%a/" ) 