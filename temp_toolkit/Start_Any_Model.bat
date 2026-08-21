@echo off
setlocal EnableDelayedExpansion
title Ultimate Portable AI Launcher

:: Change to the script's directory so it works from any drive letter
cd /d "%~dp0"

echo ====================================================
echo             PORTABLE AI MODEL LAUNCHER
echo ====================================================
echo.

:: 1. AUTOMATICALLY DOWNLOAD ENGINE IF MISSING
set ENGINE=llamafile-0.10.5.exe
if not exist "%ENGINE%" (
    echo [!] Engine not found: %ENGINE%
    echo [*] Downloading the engine from GitHub now... (One-time download)
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Mozilla-Ocho/llamafile/releases/download/0.10.5/llamafile-0.10.5.exe' -OutFile '%ENGINE%'"
    if exist "%ENGINE%" (
        echo [+] Engine downloaded successfully!
    ) else (
        echo [-] Failed to download the engine. Please check your internet connection.
        pause
        exit /b
    )
)

:: 2. SCAN FOR MODELS
set count=0
echo.
echo Available AI Models in this folder:
echo --------------------------------
for %%f in (*.gguf) do (
    set /a count+=1
    set "model[!count!]=%%f"
    echo [!count!] %%f
)

if %count%==0 (
    echo.
    echo [-] No .gguf models found in this folder!
    echo.
    echo Please copy your .gguf model files into this folder.
    echo (If you have Ollama installed, run the 'Extract_Ollama_Models.ps1' script first to export them!)
    echo.
    pause
    exit /b
)

:: 3. USER MENU
echo --------------------------------
echo.
set /p choice="Enter the number of the model you want to run: "

:: Validate the user's choice
if "!model[%choice%]!"=="" (
    echo.
    echo Invalid selection! Please run the script again.
    pause
    exit /b
)

set "selected_model=!model[%choice%]!"

echo.
echo ====================================================
echo Starting Model: %selected_model%
echo.
echo Your web browser will open automatically in a moment.
echo (Please leave this black window open while you chat!)
echo ====================================================
echo.

:: 4. RUN THE MODEL
"%ENGINE%" -m "%selected_model%" -c 4096
pause
