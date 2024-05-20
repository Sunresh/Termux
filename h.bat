@echo off
setlocal enabledelayedexpansion

:menu
cls
echo =========================================
echo  Wi-Fi Profile Manager
echo =========================================
echo 1. Show Wi-Fi Profiles
echo 2. Show Wi-Fi Passwords
echo 3. Self Update
echo 4. file Download
echo 5. Exit
echo =========================================
set /p choice="Please enter your choice: "

if "%choice%"=="1" goto show_profiles
if "%choice%"=="2" goto show_passwords
if "%choice%"=="3" goto self_update
if "%choice%"=="4" goto file_download
if "%choice%"=="5" goto end

echo Invalid choice, please try again.
pause
goto menu

:show_profiles
cls
echo List of saved Wi-Fi profiles:
echo =========================================
netsh wlan show profiles
pause
goto menu

:show_passwords
cls
echo List of saved Wi-Fi profiles and their passwords:
echo =========================================
for /f "tokens=2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "profile=%%i"
    set "profile=!profile:~1!"
    echo.
    echo Profile: !profile!
    netsh wlan show profile name="!profile!" key=clear | findstr "Key Content"
)
pause
goto menu

:end
echo Goodbye!
pause

:file_download
set /p url="Enter the URL of the file to download: "
set /p filename="Enter the name to save the file as: "

echo Downloading file from !url! ...
curl -o !filename! !url!

if %errorlevel%==0 (
    echo File downloaded successfully and saved as !filename!
) else (
    echo Failed to download the file. Please check the URL and try again.
)

pause
goto menu

:self_update
echo Downloading file from !url! ...
curl -o h.bat https://raw.githubusercontent.com/sunresh/termux/main/h.bat

if %errorlevel%==0 (
    echo File downloaded successfully and saved as !filename!
) else (
    echo Failed to download the file. Please check the URL and try again.
)

pause
goto menu