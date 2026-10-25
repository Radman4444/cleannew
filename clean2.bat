@echo off
title usv2's cleaner
color 0C

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Run as Administrator.
    pause
    exit /b 1
)

echo Cleaning...

reg delete "HKLM\SOFTWARE\EasyAntiCheat_EOS" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{E8B44A12-7A40-43A7-928E-8DA376AFA1B7}" /f >nul 2>&1
for /l %%i in (0,1,13) do (
    reg delete "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\000%%i" /v NetworkAddress /f >nul 2>&1
)

reg delete "HKCU\SOFTWARE\EasyAntiCheat_EOS" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Epic Games\Unreal Engine\Identifiers" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Epic Games\UEInstallBundleSourceBPS" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows Media\WMSDK\General" /v VolumeSerialNumber /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\DevDiv\Installation" /v DriveSerialNumber /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\DevDiv\Installation" /v MachineGuid /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\DevDiv\Installation" /v InstallationId /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\DeveloperTools" /v deviceid /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\DirectInput\MostRecentApplication" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Census" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\SQMClient" /v UserId /f >nul 2>&1
reg delete "HKCU\System\GameConfigStore\Children\3631474e-fcbf-4d79-9c14-0ca2e1108093" /f >nul 2>&1
reg delete "HKCU\System\GameConfigStore\Children\bb199acb-3db3-42b6-88c7-f640711b490e" /f >nul 2>&1
rd /s /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Crashes" 2>nul
rd /s /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Config\CrashReportClient" 2>nul
rd /s /q "C:\Users\%username%\AppData\Local\Epic Games\Epic Online Services\InstallHelper\Logs" 2>nul
rd /s /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\Logs" 2>nul
rd /s /q "C:\Users\%username%\AppData\Local\EpicGamesLauncher\Saved\webcache_4430" 2>nul
del /f /q "C:\Users\%username%\AppData\Local\FortniteGame\Saved\Cloud\*\ClientSettings.Sav" 2>nul
del /f /q "C:\Users\%username%\AppData\Local\Epic Games\Epic Online Services\EpicOnlineServicesHost\Logs\*.log" 2>nul
rd /s /q "C:\ProgramData\Epic\EpicGamesLauncher\Logs" 2>nul
rd /s /q "C:\ProgramData\Epic\EpicOnlineServices\EOSInstaller\Logs" 2>nul
rd /s /q "C:\ProgramData\Epic\EpicOnlineServices\EpicOnlineServicesHost\Logs" 2>nul
rd /s /q "C:\ProgramData\Epic\EpicOnlineServices\InstallHelper\Logs" 2>nul
rd /s /q "C:\ProgramData\Epic\EpicOnlineServices\MainService\Logs" 2>nul
del /f /q "C:\Windows\Prefetch\EASYANTICHEAT*.*" 2>nul
del /f /q "C:\Windows\Prefetch\EAC*.*" 2>nul
del /f /q "C:\Windows\Prefetch\FORTNITE*.*" 2>nul
del /f /q "C:\Windows\Prefetch\EPIC*.*" 2>nul
del /f /q "C:\Windows\Prefetch\CLIENT.EXE-*.*" 2>nul
del /f /q "%TEMP%\*EAC*.*" 2>nul
del /f /q "%TEMP%\*Epic*.*" 2>nul
del /f /q "%TEMP%\*Fortnite*.*" 2>nul

echo Done.
pause