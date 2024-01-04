@echo off
SET _service=PanGPS
sc queryex "%_service%"
sc stop %_service%
timeout 2
sc start %_service%
timeout 20