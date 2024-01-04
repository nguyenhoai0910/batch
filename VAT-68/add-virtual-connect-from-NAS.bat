@ECHO off
REM Variables: C:\Users\%username%\Desktop\
REM PATH: C:\Scripts\add-virtual-connect-from-NAS.bat
set _namefile=add-virtual-connect-from-NAS.bat
if not exist C:\Scripts-logs mkdir C:\Scripts-logs
set _log=C:\Scripts-logs\%_namefile%_%date:~10%%date:~4,2%%date:~7,2%.log
REM ======================================================
REM Driver Data (E):
REM add cho IIS nhan cac duong dan luu tru tai NAS
REM ======================================================
SET /P "qiz=Enter Excute (Y|N):
IF /I NOT "%qiz%"=="Y" (ECHO goodbye! & timeout 4 & EXIT)
ECHO site DailyVATExport (Default Web Site)
mklink /d E:\Data\DailyVATExport\2016 \\10.88.156.32\vat\2016
mklink /d E:\Data\DailyVATExport\2017 \\10.88.156.32\vat\2017
mklink /d E:\Data\DailyVATExport\2018 \\10.88.156.32\vat\2018
mklink /d E:\Data\DailyVATExport\2019 \\10.88.156.32\vat\2019
mklink /d E:\Data\DailyVATExport\2020 \\10.88.156.32\vat\2020
mklink /d E:\Data\DailyVATExport\2021 \\10.88.156.32\vat\2021
mklink /d E:\Data\DailyVATExport\2022 \\10.88.156.32\vat\2022

%windir%\system32\inetsrv\appcmd list VDIR
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2016 /physicalPath:\\10.88.156.32\vat\2016 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2017 /physicalPath:\\10.88.156.32\vat\2017 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2018 /physicalPath:\\10.88.156.32\vat\2018 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2019 /physicalPath:\\10.88.156.32\vat\2019 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2020 /physicalPath:\\10.88.156.32\vat\2020 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2021 /physicalPath:\\10.88.156.32\vat\2021 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2022 /physicalPath:\\10.88.156.32\vat\2022 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"Default Web Site/" /path:/VAT/2023 /physicalPath:\\10.88.90.68\e$\Data\DailyVATExport\2023 /userName:vat /password:<lienhe.hoainh|vienlv>

ECHO site onboarding_customer (trulyonline)
mklink /d F:\trulyonline\onboarding_customer\2020 \\10.88.156.32\vat\onboarding_customer\2020
mklink /d F:\trulyonline\onboarding_customer\2021 \\10.88.156.32\vat\onboarding_customer\2021
mklink /d F:\trulyonline\onboarding_customer\2022 \\10.88.156.32\vat\onboarding_customer\2022

%windir%\system32\inetsrv\appcmd list VDIR
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"trulyonline/" /path:/trulyonline/onboarding_customer/2020 /physicalPath:\10.88.156.32\vat\onboarding_customer\2020 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"trulyonline/" /path:/trulyonline/onboarding_customer/2021 /physicalPath:\10.88.156.32\vat\onboarding_customer\2021 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"trulyonline/" /path:/trulyonline/onboarding_customer/2022 /physicalPath:\10.88.156.32\vat\onboarding_customer\2022 /userName:vat /password:<lienhe.hoainh|vienlv>
%windir%\system32\inetsrv\appcmd add VDIR /app.name:"trulyonline/" /path:/trulyonline/onboarding_customer/2023  /physicalPath:\\10.88.90.68\f$\trulyonline\onboarding_customer\2023 /userName:vat /password:<lienhe.hoainh|vienlv>