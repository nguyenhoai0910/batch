@echo off

cd "C:\Program Files (x86)\Cisco Systems\VPN Client\" & start vpngui.exe
cmd.exe /c "C:\Program Files (x86)\Cisco Systems\VPN Client\vpnclient" disconnect
cmd.exe /c "C:\Program Files (x86)\Cisco Systems\VPN Client\vpnclient" connect VPN-SBV