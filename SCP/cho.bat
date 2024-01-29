@echo off
set status=200
if /I "%status%" NEQ "200" (
echo restart complete! )
if /I %status% EQ "200" (
echo %status%, complete! )

timeout 120
pause