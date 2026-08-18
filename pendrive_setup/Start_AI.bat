@echo off
title Portable AI Assistant
echo =========================================
echo Starting Portable AI... Please wait.
echo =========================================
:: This command ensures the script looks in the correct folder, 
:: even if the pen drive letter changes from E: to F: on another PC.
cd /d "%~dp0"
:: Change 'your_model_name.gguf' to the exact name of your model file if different.
:: Change 'llama-cli.exe' to 'main.exe' if your executable is named differently.
llama-cli.exe -m "brainmodel.gguf" -c 2048 -n 512 --color -i
echo.
echo AI has been closed.
pause
