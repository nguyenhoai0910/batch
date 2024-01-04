@echo off

FOR /F "usebackq" %%A IN (D:\hoainh\log.path) DO (set /A size = %%~zA / 1024 > NUL  & echo %%A %size% %%~zA )