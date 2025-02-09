@echo off
::========================================================================  Header  ========================================================================
::Colors Variables
set w=[97m
set p=[95m
set b=[96m
set r=[31m
set g=[92m

::Enable ANSI Escape Sequences
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enable Delayed Expansion
setlocal EnableDelayedExpansion > nul

::Enable Extensions
setlocal enableextensions > nul

::Enable UTF-8
chcp 65001  

::Verify Admin
rmdir %SystemDrive%\Windows\system32\adminrightstest  
mkdir %SystemDrive%\Windows\system32\adminrightstest  
if %errorlevel% equ 0 (goto home)

::=========================================================================  Menu  =========================================================================
:Menu
cls
echo. %r%%error%
echo. 
echo.                       %p%██╗░░░░██╗██╗███╗░░░██╗██████╗░░██████╗░██╗░░░░██╗███████╗
echo.                       %p%██║░░░░██║██║████╗░░██║██╔══██╗██╔═══██╗██║░░░░██║██╔════╝
echo.                       %p%██║░█╗░██║██║██╔██╗░██║██║░░██║██║░░░██║██║░█╗░██║███████╗
echo.                       %p%██║███╗██║██║██║╚██╗██║██║░░██║██║░░░██║██║███╗██║╚════██║
echo.                       %p%╚███╔███╔╝██║██║░╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
echo.                       %p%░╚══╝╚══╝░╚═╝╚═╝░░╚═══╝╚═════╝░░╚═════╝░░╚══╝╚══╝░╚══════╝
echo.     %p%░██████╗░██████╗░███╗░░░██╗███████╗██╗░██████╗░██╗░░░██╗██████╗░░█████╗░████████╗██╗░██████╗░███╗░░░██╗
echo.     %p%██╔════╝██╔═══██╗████╗░░██║██╔════╝██║██╔════╝░██║░░░██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗░░██║
echo.     %p%██║░░░░░██║░░░██║██╔██╗░██║█████╗░░██║██║░░███╗██║░░░██║██████╔╝███████║░░░██║░░░██║██║░░░██║██╔██╗░██║
echo.     %p%██║░░░░░██║░░░██║██║╚██╗██║██╔══╝░░██║██║░░░██║██║░░░██║██╔══██╗██╔══██║░░░██║░░░██║██║░░░██║██║╚██╗██║
echo.     %p%╚██████╗╚██████╔╝██║░╚████║██║░░░░░██║╚██████╔╝╚██████╔╝██║░░██║██║░░██║░░░██║░░░██║╚██████╔╝██║░╚████║
echo.     %p%░╚═════╝░╚═════╝░╚═╝░░╚═══╝╚═╝░░░░░╚═╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚═════╝░╚═╝░░╚═══╝
echo.
echo.                       %b%╔═══════════════════════════════════════════════════════════╗%w%
echo.                       %b%║                                                           %b%║
echo.                       %b%║                                                           %b%║
echo.                       %b%║                 %p%[1]%w% Home      %p%[2]%w% School                  %b%║
echo.                       %b%║                                                           %b%║   
echo.                       %b%║                                                           %b%║    
echo.                       %b%╚═══════════════════════════════════════════════════════════╝       
set /p input=%b%:
if /i %input% == 1 goto home
if /i %input% == 2 goto school
set error=Invalid Input, Try Again!
goto Menu

::=========================================================================  Home  =========================================================================
:home
cls

::Admin
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Checking for Administrative Privelages...     %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
rmdir %SystemDrive%\Windows\system32\adminrightstest  
mkdir %SystemDrive%\Windows\system32\adminrightstest  
if %errorlevel% neq 0 (   
cls 
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║  %w% Running as Administrator...                     %b% ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'"   && exit /b)
if %errorlevel% neq 0 (set error=For option one, administrator privilege is required! && goto Menu)

::Windows Activation
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Activating the Windows...                         %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
start /wait powershell -Command "irm https://get.activated.win | iex"

::Windows Personalization
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Customizing the Windows...                    %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d "1" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f  
reg add "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "1" /f  
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "%SolidColorWallpaperPath%" /f  
reg add "HKCU\Control Panel\Desktop" /v "WallpaperStyle" /t REG_SZ /d "0" /f  
reg add "HKCU\Control Panel\Desktop" /v "TileWallpaper" /t REG_SZ /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f
powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v}"  
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
del /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /F
Get-AppxPackage | Where-Object {$_.Name -Like '*Microsoft.Copilot*'} | Remove-AppxPackage -ErrorAction Continue
curl -g -k -L -# -o "c:\Users\%USERNAME%\Downloads\accelSwitch.exe" "https://github.com/jan-glx/accelSwitch/releases/download/v1.2.29/accelSwitch.exe" >nul 2>&1
"c:\Users\%USERNAME%\Downloads\accelSwitch.exe" off
del c:\Users\%USERNAME%\Downloads\accelSwitch.exe

::Uninstalling OneDrive
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Uninstalling OneDrive...                      %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
taskkill /f /im OneDrive.exe 
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
%SystemRoot%\System32\OneDriveSetup.exe /uninstall 

::Downloading Apps
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Downloading Apps                              %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
start powershell -Command "irm https://gist.githubusercontent.com/emilwojcik93/788eca2e456488c360fabc15d274031d/raw/Install-NvidiaApp.ps1 | iex"
start winget install Git.Git --accept-source-agreements --accept-package-agreements --silent --location "C:\Program Files\Baixados\Git"
start winget install OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements --silent --location "C:\Program Files\Baixados\NodeJS"
start winget install 7zip.7zip --accept-source-agreements --accept-package-agreements --silent --location "C:\Program Files\Baixados\7zip"
start /wait winget install Mozilla.Firefox --accept-source-agreements --accept-package-agreements --silent
start Firefox
start /wait winget install Valve.Steam --accept-source-agreements --accept-package-agreements --silent --location "C:\Program Files\Baixados\Steam"
"C:\Program Files\Baixados\Steam\steam.exe"
start /wait winget install Discord.Discord --accept-source-agreements --accept-package-agreements --silent
"C:\Users\Casa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
start /wait winget install Guru3D.Afterburner --accept-source-agreements --accept-package-agreements --silent
"C:\Users\Casa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\MSI Afterburner\MSI Afterburner.lnk"
start /wait winget install Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements --silent --location "C:\Program Files\Baixados\VScode"
"C:\Program Files\Baixados\VScode\Code.exe"
start steam://install/431960
"c:\Program Files\NVIDIA Corporation\NVIDIA app\CEF\NVIDIA app.exe"

:: Reiniciando o Explorer
taskkill /f /im explorer.exe & start explorer.exe
pause
exit

::========================================================================  School  ========================================================================
:school
cls

::Fake Admin
set __COMPAT_LAYER=RUNASINVOKER

::Windows Personalization
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Customizing the Windows...                    %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d "1" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f
powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
del /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /F
curl -g -k -L -# -o "c:\Users\%USERNAME%\Downloads\accelSwitch.exe" "https://github.com/jan-glx/accelSwitch/releases/download/v1.2.29/accelSwitch.exe" >nul 2>&1
"c:\Users\%USERNAME%\Downloads\accelSwitch.exe" off
del c:\Users\%USERNAME%\Downloads\accelSwitch.exe
gdown --fuzzy https://drive.google.com/file/d/1uwiWOPt5PWSDbBAaTQFStfILaikGnLLE/view?usp=sharing -O c:\Users\%USERNAME%\Downloads\ >nul 2>&1 
"c:\Users\Casa\%USERNAME%\GroupByNone.reg"
del c:\Users\%USERNAME%\Downloads\accelSwitch.exe

::Downloading Apps
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Downloading Apps                              %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
start winget install Git.Git --accept-source-agreements --accept-package-agreements --silent --scope USER
start winget install OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements --silent --scope USER
start winget install 7zip.7zip --accept-source-agreements --accept-package-agreements --silent --scope USER
start /wait winget install Mozilla.Firefox --accept-source-agreements --accept-package-agreements --silent --scope USER
start Firefox
start /wait winget install Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements --silent --scope USER
start Code

::Desktop Personalization
cls
echo.
echo. %b%╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Customizing the desktop...                    %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
start powershell -Command "Invoke-WebRequest http://workshop.abcvg.info/archive/431960/2162272707.zip -o c:\Users\%USERNAME%\Downloads\2162272707.zip"
start powershell -Command "Invoke-WebRequest http://workshop.abcvg.info/archive/431960/1160682576.zip -o c:\Users\%USERNAME%\Downloads\1160682576.zip"
start powershell -Command "Invoke-WebRequest http://workshop.abcvg.info/archive/431960/1583242242.zip -o c:\Users\%USERNAME%\Downloads\1583242242.zip"
winget install Python.Python.3.10 --scope USER
pip install gdown
gdown --fuzzy https://drive.google.com/file/d/1ZzXzX1S81BNo-69Rl033qxRfm-3PdO6g/view?usp=sharing -O c:\Users\%USERNAME%\Downloads\ >nul 2>&1 
powershell -NoProfile Expand-Archive 'c:\Users\%USERNAME%\Downloads\WP.zip' -DestinationPath 'C:\Users\%USERNAME%\Baixados' >nul 2>&1 
powershell -NoProfile Expand-Archive 'c:\Users\%USERNAME%\Downloads\2162272707.zip' -DestinationPath 'C:\Users\%USERNAME%\Baixados\WP\projects\myprojects' >nul 2>&1
powershell -NoProfile Expand-Archive 'c:\Users\%USERNAME%\Downloads\1160682576.zip' -DestinationPath 'C:\Users\%USERNAME%\Baixados\WP\projects\myprojects' >nul 2>&1
powershell -NoProfile Expand-Archive 'c:\Users\%USERNAME%\Downloads\1583242242.zip' -DestinationPath 'C:\Users\%USERNAME%\Baixados\WP\projects\myprojects' >nul 2>&1
del C:\Users\%USERNAME%\Downloads\WP.rar
del C:\Users\%USERNAME%\Downloads\2162272707.zip
del C:\Users\%USERNAME%\Downloads\1160682576.zip
del C:\Users\%USERNAME%\Downloads\1583242242.zip
start /d "C:\Users\%USERNAME%\Baixados\WP" installer.exe

:: Reiniciando o Explorer
taskkill /f /im explorer.exe & start explorer.exe
pause
exit