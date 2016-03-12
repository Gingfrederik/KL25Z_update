@echo off
SETLOCAL enabledelayedexpansion
rem GET KL25Z BOOTLOADER DEVICEID
for /F "tokens=2 delims==" %%G in ('
    WMIC logicaldisk where "VolumeName='BOOTLOADER'" get DeviceID /value 2^>NUL ^| find "="
') do for /F "tokens=*" %%i in ("%%G") do (
    set diskname=%%i
)
echo %diskname%
copy /B "./BOOTUPDATEAPP.SDA" "%diskname%/"
echo �ޱ�usb�᭫�s���J
timeout /t 10 /nobreak
copy /B "./MSD-DEBUG-FRDM-KL25Z.SDA" "%diskname%/"
echo �ޱ�usb�u�᭫�s���J
timeout /t 10 /nobreak
ENDLOCAL
pause