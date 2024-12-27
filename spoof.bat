@echo off
echo.
echo  SSSSS  PPPP   OOO   FFFFF
echo  SS     PP  PP  O   O  FF
echo  SSSSS  PPPPPP  O   O  FFFF
echo     SS  PP      O   O  FF
echo  SSSSS  PP      OOO   FF
echo.
echo Spoofing.
timeout /t 2 /nobreak
echo Spoofing..
timeout /t 2 /nobreak
echo Spoofing...
timeout /t 2 /nobreak

echo Sunucu durumu kontrol ediliyor...
timeout /t 1 /nobreak
del /q /f /s "%temp%\*"

ipconfig /release
ipconfig /renew

echo [+] Islem tamamlandi..
pause
