@echo off
F:
cd F:\trulyonline\onboarding_customer
for /f "usebackq tokens=1-5 delims=," %a in ("test_csv.txt") do ( echo %a %b %c %d %e && if not exist "test/%a" mkdir "test/%a" && copy "%c" "test/%a/" && copy "%d" "test/%a/" && copy "%e" "test/%a/" ) 