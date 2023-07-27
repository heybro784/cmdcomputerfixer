@echo off
AT > NUL
IF %ERRORLEVEL% EQU 0 (
    sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth /Source:repairSource\install.wim

) ELSE (
    ECHO This is not being ran as admin. Exiting...
    PING 127.0.0.1 > NUL 2>&1
    EXIT /B 1
)

