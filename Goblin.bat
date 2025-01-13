@echo Off
color 04

title Yektax2Q / Kromozom              ##K#A#L#I#T#E##

color 01
echo    Ｇｏｂｌｉｎ  Ｇｏｂｌｉｎ Ｇｏｂｌｉｎ
color 02
echo Ｇｏｂｌｉｎ    Ｇｏｂｌｉｎ   Ｇｏｂｌｉｎ
color 03
echo   Ｇｏｂｌｉｎ      Ｇｏｂｌｉｎ   Ｇｏｂｌｉｎ
color 05
echo GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN GOBLIN
echo    Ｇｏｂｌｉｎ  Ｇｏｂｌｉｎ Ｇｏｂｌｉｎ
color 06
echo Ｇｏｂｌｉｎ    Ｇｏｂｌｉｎ   Ｇｏｂｌｉｎ
color 07
echo   Ｇｏｂｌｉｎ      Ｇｏｂｌｉｎ   Ｇｏｂｌｉｎ

echo.
echo.
echo.


echo GGGGG    OOOOO    BBBBB   L        II   N    N
echo G       O     O   B    B  L             NN   N
echo G       O     O   BBBBB   L        II   N N  N
echo G  GGG  O     O   BBBBB   L        II   N  N N
echo G    G  O     O   B    B  L        II   N   NN
echo GGGGG    OOOOO    BBBBB   LLLLLLL  II   N    N

echo.
echo.
echo.

color 04

:Menu
SET /P choice1= -Entera bas Gerisini Babaya Birak
IF /I "%choice1%"=="Enter" GOTO Go 


:GO
@ECHO ON
Netsh int tcp show global dca=enabled
Netsh int tcp show global netdma=enabled
Netsh int tcp show global rss=enabled
Netsh int tcp show global chimney=enabled
Netsh int tcp show global=autotuninglevel=normal
int tcp set heuristics disabled
int tcp set global rss=enabled
int tcp set global chimney=enabled
int tcp set global autotuninglevel=normal
int tcp set global congestionprovider=ctcp
int tcp set global ecncapability=disabled
int tcp set global timestamps=disabled

Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
wmic process where name="sonoyuncuclient.exe" CALL setpriority "high priority"
cls
wmic process where name="craftrise-x64.exe" CALL setpriority "high priority"
cls
wmic process where name="VimeWorld.exe" CALL setpriority "high priority"
cls

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d 229375 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MTU" /t REG_DWORD /d 1500 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MSS" /t REG_DWORD /d 1460 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d 4096 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 50 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d 96452 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d 65536 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
cls


netsh int tcp set heuristics disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
@ECHO OFF
cd %temp%
ECHO > SG_Vista_TcpIp_Patch.reg Windows Registry Editor Version 5.00  
ECHO >> SG_Vista_TcpIp_Patch.reg [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters] 
ECHO >> SG_Vista_TcpIp_Patch.reg "DefaultTTL"=dword:00000040
ECHO >> SG_Vista_TcpIp_Patch.reg "EnableTCPA"=dword:00000001
ECHO >> SG_Vista_TcpIp_Patch.reg "Tcp1323Opts"=dword:00000001
ECHO >> SG_Vista_TcpIp_Patch.reg "TCPMaxDataRetransmissions"=dword:00000007
ECHO >> SG_Vista_TcpIp_Patch.reg "TCPTimedWaitDelay"=dword:0000001e
ECHO >> SG_Vista_TcpIp_Patch.reg "SynAttackProtect"=dword:00000001
ECHO >> SG_Vista_TcpIp_Patch.reg "EnableDCA"=dword:00000001
ECHO >> SG_Vista_TcpIp_Patch.reg [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider]
ECHO >> SG_Vista_TcpIp_Patch.reg "LocalPriority"=dword:00000004
ECHO >> SG_Vista_TcpIp_Patch.reg "HostsPriority"=dword:00000005
ECHO >> SG_Vista_TcpIp_Patch.reg "DnsPriority"=dword:00000006
ECHO >> SG_Vista_TcpIp_Patch.reg "NetbtPriority"=dword:00000007
regedit /s SG_Vista_TcpIp_Patch.reg
del SG_Vista_TcpIp_Patch.reg
cls
netsh int tcp set supplemental template=custom icw=15
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CaretTimeout" /t REG_DWORD /d "1000" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "1000" /f
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
Reg.exe add %%i /v "TcpAckFrequency" /d "3" /t REG_DWORD /f
Reg.exe add %%i /v "TCPDelAckTicks" /d "0" /t REG_DWORD /f
)
wmic process where name="sonoyuncuclient.exe" CALL setpriority "high priority"

wmic process where name="craftrise-x64.exe" CALL setpriority "high priority"
wmic process where name="VimeWorld.exe" CALL setpriority "high priority"
netsh int tcp set global fastopen=enabled
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
wmic process where name="svchost.exe" CALL setpriority "high priority"
netsh int tcp show global
netsh interface ipv4 set interface "Ethernet" mtu=1450
netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
netsh int tcp set supplemental custom congestionprovider=ctcp
netsh int tcp set global initialRto=1550
netsh int tcp set global rsc=enabled
netsh int tcp set global netdma=disabled
netsh int tcp set global maxsynretransmissions=4
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*
cls