@echo off


//CHANGE THIS EVERY UPDATE!
set datemodified=3-04-24 3:38 PM CDT
//
set RobloxPath=Not manually set.



title Jake's Tool
setlocal EnableDelayedExpansion
cls
cd %temp%/JakesTool
color 0a
set filehost=https://filehost.losernerd.com
echo filehost: %filehost%
echo updated %datemodified%
echo latest update: changed tool directory from C:/ to temp
echo press any key to continue
pause > nul
:menu
cls
color 1a
echo Welcome to Jake's Tool
echo 1. Free Spotify Premium (SpotX)
echo 2. Roblox Menu
echo 3. Exit


set /p choice=Enter choice (e.g, "1"): 

if "%choice%"=="1" goto spotify
if "%choice%"=="2" goto robloxmenu
if "%choice%"=="3" exit

cls
echo Please choose a valid option.
echo Current directory: %cd%
timeout 3 > nul
goto menu


////////////////////////////////////////////////////////////////// Free Spotify Prem


:spotify
cls
echo Are you sure you want to patch Spotify?
set /p choice=Do you want to continue (Y/N)?
if /I "%choice%"=="Y" goto spotifyyes
if /I "%choice%"=="N" goto spotifyno


:spotifyyes
cls
curl %filehost%/files/spotify/spotx.bat --output spotx.bat
cls
start /wait "" spotx.bat

echo Done
echo Press any key to go back to the main menu.
pause > nul
del /f spotx.bat
goto menu

:spotifyno
goto menu




////////////////////////////////////////////////////////////////// Roblox Menu


:robloxmenu
cls
color 4f
echo Welcome to Jake's Roblox Utilities
echo Roblox Filepath: %RobloxPath%
echo 1. Set Roblox File Location Manually
echo 2. Set Roblox File Location Automatically
echo 3. Old Oof Sound
echo 4. Old Cursor
echo 5. Install Roblox FPS Unlocker
echo 6. Download/Update Roblox
echo 7. Delete Roblox
echo 8. Main Menu
set /p choice=Enter choice (e.g, "1"): 

if "%choice%"=="1" goto manualrobloxpath
if "%choice%"=="2" goto autorobloxpath
if "%choice%"=="3" goto oofsound
if "%choice%"=="4" goto cursor
if "%choice%"=="5" goto rbxfpsunlocker
if "%choice%"=="6" goto dlroblox
if "%choice%"=="7" goto delroblox
if "%choice%"=="8" goto menu

cls
echo Please choose a valid option.
timeout 3 > nul
goto robloxmenu


////////////////////////////////////////////////////////////////// Manual Roblox Path Set

:manualrobloxpath
cls
echo Example of the correct filepath: C:\Users\Quandale\AppData\Local\Roblox\Versions\version-a1b2c3f4g5h6f7g8
set /p RobloxPath=Enter Roblox's filepath here: 
echo Roblox filepath set.
set robloxpathset=yes
if "%RobloxPath%"=="Not manually set." set robloxpathset=no
goto robloxmenu



////////////////////////////////////////////////////////////////// Automatic Roblox Path Set

:autorobloxpath
cls
echo Example of the correct filepath: C:\Users\Quandale\AppData\Local\Roblox\Versions\version-a1b2c3f4g5h6f7g8
echo Finding Roblox version...

for /f "tokens=* delims=" %%a in ('where /r C:\Users\%username%\AppData\Local\Roblox\Versions "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
cls
if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "C:\Program Files (x86)\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)
cls
if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "%ProgramFiles%\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)
cls
if not defined robloxExecutable (
echo Roblox not found. Please make sure you have installed and have ran Roblox before attempting to find it.
goto robloxpause
)

echo.
cls
:autoverchoice
echo Version Found: !robloxVersion!
set /p choice=Would you like to set this as your Roblox path? (y/n): 
if "%choice%"=="y" (
set robloxpathset=yes
set RobloxPath=!robloxVersion!
cls
echo Roblox path has been set to "!robloxVersion!".
echo Press any key to go back to the main menu.
pause > nul
goto robloxmenu
)

if "%choice%"=="n" (
cls
echo Roblox Version: !robloxVersion!
echo Press any key to go back to the main menu.
pause > nul
goto robloxmenu
)

cls
Please pick a valid option.
timeout 2 > nul
goto autoverchoice

////////////////////////////////////////////////////////////////// Oof Patch


:oofsound
cls
echo You have chosen to replace the current oof sound with the old one.

if "%robloxpathset%"=="yes" goto OofInstallWRbxSet
if "%robloxpathset%"=="no" goto OofInstallWRbxNOTSet
:OofInstallWRbxNOTSet
echo Finding Roblox version...

for /f "tokens=* delims=" %%a in ('where /r C:\Users\%username%\AppData\Local\Roblox\Versions "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)

if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "C:\Program Files (x86)\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)

if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "%ProgramFiles%\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)

if not defined robloxExecutable (
echo Roblox not found. Please make sure you have installed and ran Roblox or specify the correct file path.
goto robloxpause
)

echo.
cls
echo Version Found: !robloxVersion!

echo Finding oof sound..
echo.
for /f "delims=" %%a in ('dir "!robloxVersion!" /s /b ^| findstr /i /c:"ouch.ogg"') do (
set "OofSound=%%a"
goto :done
)
:done
if not defined OofSound (
echo Oof sound not found.
echo Downloading and applying Oof sound..
del /f "!robloxVersion!\content\sounds\ouch.ogg"
curl "%filehost%/files/roblox/oof/ouch.ogg" --output ouch.ogg
xcopy /y "ouch.ogg" "!robloxVersion!\content\sounds"
echo.
cls
echo Oof sound replaced successfully.


goto robloxpause
)
(
echo Oof sound found.
echo Replacing Oof sound..
del /f "!robloxVersion!\content\sounds\ouch.ogg"
curl "%filehost%/files/roblox/oof/ouch.ogg" --output ouch.ogg
xcopy /y "ouch.ogg" "!robloxVersion!\content\sounds"
echo.
cls
echo Oof sound replaced successfully.
)
echo Press any key to go back to the Roblox menu.
pause > nul
del /f "%cd%\ouch.ogg"
goto robloxmenu


:OofInstallWRbxSet
echo Roblox Filepath: %RobloxPath% (Manually Set)
echo Finding oof sound..
echo.
for /f "delims=" %%a in ('dir "%RobloxPath%" /s /b ^| findstr /i /c:"ouch.ogg"') do (
set "OofSound=%%a"
goto :done
)
:done
if not defined OofSound (
echo Oof sound not found.
echo Downloading and applying Oof sound..
del /f "%RobloxPath%\content\sounds\ouch.ogg"
curl %filehost%/files/roblox/oof/ouch.ogg -o ouch.ogg
xcopy /y "ouch.ogg" "%RobloxPath%\content\sounds"
echo.
cls
echo Oof sound replaced successfully.


goto robloxpause
)
(
echo Oof sound found.
echo Replacing Oof sound..
del /f "%RobloxPath%\content\sounds\ouch.ogg"
curl "%filehost%/files/roblox/oof/ouch.ogg" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8" -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate" -H "DNT: 1" -H "Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1"
xcopy /y "ouch.ogg" "%RobloxPath%\content\sounds"
echo.
cls
echo Oof sound replaced successfully.
)
echo Press any key to go back to the Roblox menu.
pause > nul
del /f "%cd%\ouch.ogg"
goto robloxmenu




////////////////////////////////////////////////////////////////// Old Cursor



:cursor
cls
echo You have chosen to replace the current cursor with the old one.
if "%robloxpathset%"=="yes" goto CrsInstallWRbxSet
if "%robloxpathset%"=="no" goto CrsInstallWRbxNOTSet

:CrsInstallWRbxNOTSet
echo Finding Roblox version...

for /f "tokens=* delims=" %%a in ('where /r C:\Users\%username%\AppData\Local\Roblox\Versions "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)

if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "C:\Program Files (x86)\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)

if not defined robloxExecutable (
for /f "tokens=* delims=" %%a in ('where /r "%ProgramFiles%\Roblox" "RobloxPlayerBeta.exe"') do (
set robloxExecutable=%%a
set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
echo RobloxVersion: !robloxVersion!
echo RobloxFile: !robloxExecutable!
)
)

if not defined robloxExecutable (
echo Roblox not found. Please make sure you have installed and ran Roblox or specify the correct file path.
goto robloxpause
)

echo.
cls
echo Version Found: !robloxVersion!

echo Finding cursors folder..
echo.
for /f "delims=" %%a in ('dir "!robloxVersion!" /s /b ^| findstr /i /c:"Cursors"') do (
set "CursorsFolder=%%a"
goto :done
)
:done
echo Cursors found: %CursorsFolder%\KeyboardMouse
echo Replacing cursors..
del /f "%CursorsFolder%\KeyboardMouse\ArrowCursor.png"
del /f "%CursorsFolder%\KeyboardMouse\ArrowFarCursor.png"
curl %filehost%/files/roblox/cursors/ArrowCursor.png -o ArrowCursor.png
xcopy /y "ArrowCursor.png" "%CursorsFolder%\KeyboardMouse"
curl %filehost%/files/roblox/cursors/ArrowFarCursor.png -o ArrowFarCursor.png
xcopy /y "ArrowFarCursor.png" "%CursorsFolder%\KeyboardMouse"
echo.
cls
echo Cursors replaced successfully.
echo Press any key to go back to the Roblox menu.
pause > nul
del /f "%cd%\ArrowFarCursor.png"
del /f "%cd%\ArrowCursor.png"
goto robloxmenu

:CrsInstallWRbxSet
echo Finding cursors folder..
echo.
for /f "delims=" %%a in ('dir "%RobloxPath%" /s /b ^| findstr /i /c:"Cursors"') do (
set "CursorsFolder=%%a"
goto :done
)
:done
echo Cursors found: %CursorsFolder%\KeyboardMouse
echo Replacing cursors..
del /f "%CursorsFolder%\KeyboardMouse\ArrowCursor.png"
del /f "%CursorsFolder%\KeyboardMouse\ArrowFarCursor.png"
curl %filehost%/files/roblox/cursors/ArrowCursor.png -o ArrowCursor.png
xcopy /y "ArrowCursor.png" "%CursorsFolder%\KeyboardMouse"
curl %filehost%/files/roblox/cursors/ArrowFarCursor.png -o ArrowFarCursor.png
xcopy /y "ArrowFarCursor.png" "%CursorsFolder%\KeyboardMouse"
echo.
cls
echo Cursors replaced successfully.
echo Press any key to go back to the Roblox menu.
pause > nul
del /f "%cd%\ArrowFarCursor.png"
del /f "%cd%\ArrowCursor.png"
goto robloxmenu

////////////////////////////////////////////////////////////////// rbxfpsunlocker


:rbxfpsunlocker
cd C:\Users\%username%\Desktop\
cls
echo You have chosen to install the Roblox FPS unlocker.
echo Downloading FPS unlocker...
curl %filehost%/files/roblox/fpsunlocker/rbxfpsunlocker.exe -o rbxfpsunlocker.exe
cls
echo Starting FPS unlocker.
Start "" rbxfpsunlocker.exe
echo Done.
echo Would you like to move the FPS unlocker to your startup folder?
set /p fpsyesno=Enter choice ("yes", "no"):

if "%fpsyesno%"=="yes" goto startupFPSYes
if "%fpsyesno%"=="no" goto startupFPSNo


:startupFPSNo
cls
echo Okay.
echo Your Roblox FPS Unlocker executable file is on your desktop.
del settings
echo.
echo Press any key to go back to the Roblox menu.
pause > nul
goto robloxmenu

:startupFPSYes
cls
echo Moving FPS unlocker to Startup folder.
move "rbxfpsunlocker.exe" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" > nul

echo Done.
move "settings" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" > nul
echo Press any key to go back to the Roblox menu.
pause > nul
goto robloxmenu







:dlroblox
echo Finding Roblox version...

for /f "tokens=* delims=" %%a in ('where /r C:\Users\%username\AppData\Local\Roblox\Versions "RobloxPlayerBeta.exe"') do (
    set robloxExecutable=%%a
    set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
    echo RobloxVersion: !robloxVersion!
    echo RobloxFile: !robloxExecutable!
)

if not defined robloxExecutable (
    for /f "tokens=* delims=" %%a in ('where /r "C:\Program Files (x86)\Roblox" "RobloxPlayerBeta.exe"') do (
        set robloxExecutable=%%a
        set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
        echo RobloxVersion: !robloxVersion!
        echo RobloxFile: !robloxExecutable!
    )
)

if not defined robloxExecutable (
    for /f "tokens=* delims=" %%a in ('where /r "%ProgramFiles%\Roblox" "RobloxPlayerBeta.exe"') do (
        set robloxExecutable=%%a
        set robloxVersion=!robloxExecutable:\RobloxPlayerBeta.exe=!
        echo RobloxVersion: !robloxVersion!
        echo RobloxFile: !robloxExecutable!
    )
)

if not defined robloxExecutable (
    echo Skipping Roblox deletion...
    goto robloxcontinue
)

echo.
cls
echo Version Found: !robloxVersion!
echo Deleting current version..
del !robloxVersion!
cls
echo Downloading Roblox..
curl -o C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe https://setup.rbxcdn.com/version-be30b823d3fc46a0-Roblox.exe

cls
echo Starting Roblox Installer...
"C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe"
echo Starting Roblox...
"C:\Users\%username%\Desktop\Roblox Player.lnk"
cls
echo Deleting any unnecessary remaining files...
del /f /q "C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe"
cls
echo Done.
echo Press any key to go back to the Roblox menu.
pause > nul

goto robloxmenu

:robloxcontinue
echo Roblox not found, continuing download script
echo Downloading Roblox..
curl -o C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe https://setup.rbxcdn.com/version-be30b823d3fc46a0-Roblox.exe

cls
echo Starting Roblox Installer...
"C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe"
echo Starting Roblox...
"C:\Users\%username%\Desktop\Roblox Player.lnk"
cls
echo Deleting any unnecessary remaining files...
del /f /q "C:\Users\%username%\Downloads\RobloxPlayerLauncher.exe"
cls
echo Done.
echo Press any key to go back to the Roblox menu.
pause > nul

goto robloxmenu


////////////////////////////////////////////////////////////////// Roblox Delete
:delroblox
cls
echo Are you sure you want to delete roblox? (yes/no)
set /p delchoice=Enter choice (e.g, "yes", "no"):

if "%delchoice%"=="no" goto deleteno
if "%delchoice%"=="yes" goto deleteyes

:deleteyes
cls
echo Finding Roblox
echo Roblox Folder: C:\Users\%username%\AppData\Local\Roblox
echo Deleting..
for /f "delims=" %%i in ('dir /b /s "C:\Users\%username%\AppData\Local\Roblox"') do (
    echo Deleting "%%i"
    del /q "%%i"
)
rmdir /s /q "C:\Users\%username%\AppData\Local\Roblox"
echo Roblox has been deleted. Press any key to go back to the Roblox menu.

pause > nul
goto robloxmenu

:deleteno
echo Cancelling.
goto robloxmenu


////////////////////////////////////////////////////////////////// Pause

:robloxpause
pause
goto robloxmenu
