@echo off
title Qwen AI Web Interface
echo ====================================================
echo  Starting Qwen AI...
echo  Your web browser will open automatically in a moment.
echo ====================================================
echo.
echo (Please leave this black window open while you chat!)
echo.
cd /d "%~dp0"
llamafile-0.10.5.exe -m qwen3-4b-thinking-2507.Q4_K_M.gguf -c 4096
pause
