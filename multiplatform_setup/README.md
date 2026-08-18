# 🌍 Multi-Platform Portable AI Setup

This folder provides scripts to run your offline AI models (`.gguf` files) across **Windows**, **macOS**, and **Linux** systems!

## 📦 Prerequisites
1. **The Model:** You must place your AI model file in this folder. For these scripts, it MUST be named **`brainmodel.gguf`** (or you can right-click and edit the scripts to match your specific model's name).
2. **The Engine:** You need the `llama-cli` engine for your specific operating system.

---

## 🪟 Windows
1. Open the folder and double-click **`Start_AI_Windows.bat`**.
2. **Missing the engine?** The absolute easiest way to run models on Windows is to use the `pendrive_setup` folder instead, which features an incredible all-in-one auto-downloading script!

---

## 🍏 macOS
1. **Download the Engine:** Download the macOS version of `llama-cli` from the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases). 
   - Apple Silicon (M1/M2/M3): Download `...-bin-macos-arm64.zip`
   - Intel Mac: Download `...-bin-macos-x64.zip`
2. Extract the zip and place the file named `llama-cli` (no `.exe` extension) directly into this folder.
3. **Run:** Open the Terminal, drag and drop **`Start_AI_Mac_Linux.sh`** into the terminal window, and press Enter.

---

## 🐧 Linux
1. **Download the Engine:** Download the Linux version of `llama-cli` from the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases). (Look for `...-bin-ubuntu-x64.zip`).
2. Extract it and place `llama-cli` directly into this folder.
3. **Run:** Open your terminal, navigate to this folder, and execute:
   ```bash
   ./Start_AI_Mac_Linux.sh
   ```

---

## 💾 Exporting from Ollama (Windows Only)
If you already use Ollama on Windows, you can easily export your hidden models for use in these portable setups!
1. Right-click **`Extract_Ollama_Models.ps1`** in this folder.
2. Select **"Run with PowerShell"**.
3. A menu will appear. Simply type the number of the model you want to export, and it will be safely copied out into `.gguf` format!
