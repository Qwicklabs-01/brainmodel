@echo off
title Portable AI Assistant (Windows)
echo =========================================
echo Starting Portable AI on Windows...
echo =========================================
cd /d "%~dp0"
llama-cli.exe -m "brainmodel.gguf" -c 2048 -n 512 --color -i
echo.
pause
