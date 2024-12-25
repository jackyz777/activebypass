@echo off
color 04
echo Thxx for buy
echo Thxx for buy
echo Thxx for buy
echo Thxx for buy
echo Thxx for buy
echo Thxx for buy
echo Thxx for buy
setlocal enabledelayedexpansion


@echo off
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
    Reg.exe add %%i /v "TcpAckFrequency" /d "1" /t REG_DWORD /f
    Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
    Reg.exe add %%i /v "TCPDelAckTicks" /d "0" /t REG_DWORD /f
    Reg.exe add %%i /v "MTU" /d "1344" /t REG_DWORD /f
    Reg.exe add %%i /v "MSS" /d "1304" /t REG_DWORD /f
    Reg.exe add %%i /v "TcpWindowSize" /d "64240" /t REG_DWORD /f
)

sc config "BITS" start= auto
sc start "BITS"
for /f "tokens=3" %%a in ('sc queryex "BITS" ^| findstr "PID"') do (set pid=%%a)
wmic process where ProcessId=%pid% CALL setpriority "idle"
sc config "Dnscache" start= demand
sc start "Dnscache"
for /f "tokens=3" %%a in ('sc queryex "Dnscache" ^| findstr "PID"') do (set pid=%%a)
wmic process where ProcessId=%pid% CALL setpriority "idle"
wmic process where name="mqsvc.exe" CALL setpriority "high priority"
wmic process where name="mqtgsvc.exe" CALL setpriority "high priority"
wmic process where name="javaw.exe" CALL setpriority "normal"
wmic process where name="sonoyuncuclient.exe" CALL setpriority "high priority"

netsh int tcp set global rsc=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh winsock reset catalog
netsh int tcp set global rsc=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global timestamps=disabled

@echo off
title HitDetection fix by Ghospachoo
netsh int tcp set global rsc=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global timestamps=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set supplemental template=custom icw=10
pause
