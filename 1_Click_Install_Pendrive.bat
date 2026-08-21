@echo off
echo ==============================================================
echo Portable AI Pendrive Installer
echo ==============================================================
echo This script will download and setup the AI Engine and Model.
echo Make sure you are running this file directly on the pendrive!
echo Please ensure you have an active internet connection.
echo ==============================================================
echo.

powershell -Command "Write-Host 'Downloading AI Engine (llama-cli)...' -ForegroundColor Green; $url='https://github.com/ggml-org/llama.cpp/releases/download/b10545/llama-b10545-bin-win-cpu-x64.zip'; Invoke-WebRequest -Uri $url -OutFile 'llama.zip'; Expand-Archive -Path 'llama.zip' -DestinationPath '.' -Force; Remove-Item 'llama.zip';"

echo Downloading Qwen AI Model (~398MB)...
curl.exe -L -o "qwen-model.gguf" "https://huggingface.co/Qwen/Qwen2-0.5B-Instruct-GGUF/resolve/main/qwen2-0_5b-instruct-q4_k_m.gguf"

powershell -Command "Write-Host 'Downloading AI Runner Script...' -ForegroundColor Green; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/x/x/main/Start_Any_Model.bat' -OutFile 'Start_Any_Model.bat' -ErrorAction SilentlyContinue"

:: Fallback if Start_Any_Model.bat can't be downloaded from a raw link
echo @echo off > Start_Any_Model.bat
echo title Portable AI Assistant >> Start_Any_Model.bat
echo echo ========================================= >> Start_Any_Model.bat
echo echo Starting Portable AI... Please wait. >> Start_Any_Model.bat
echo echo ========================================= >> Start_Any_Model.bat
echo cd /d "%%~dp0" >> Start_Any_Model.bat
echo llama-cli.exe -m "qwen-model.gguf" -c 2048 -n 512 --color -i >> Start_Any_Model.bat
echo pause >> Start_Any_Model.bat

echo.
echo ==============================================================
echo Setup Complete! 
echo You can now double-click 'Start_Any_Model.bat' to start the AI.
echo ==============================================================
pause
