# Multi-Platform Portable AI Setup Guide

This folder contains the scripts needed to run your AI model (`brainmodel.gguf`) offline on **Windows**, **Mac**, and **Linux**, as well as instructions for **Mobile**.

## The Universal Requirement
No matter what platform you are on, you MUST have the AI model file named exactly:
**`brainmodel.gguf`**
Place it inside this folder alongside the setup scripts.

---

## 🪟 Windows Setup
1. **Download the Engine**: Download the Windows version of `llama-cli.exe` from the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases). (Look for `llama-bXXXX-bin-win-avx2-x64.zip`).
2. Extract it and place `llama-cli.exe` in this folder.
3. **Run**: Double-click `Start_AI_Windows.bat`.

---

## 🍏 Mac Setup
1. **Download the Engine**: Download the macOS version of `llama-cli` from the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases). 
   - If you have an M1/M2/M3 (Apple Silicon) Mac, download the `...-bin-macos-arm64.zip`.
   - If you have an Intel Mac, download the `...-bin-macos-x64.zip`.
2. Extract it and place the file named `llama-cli` (no `.exe` extension) in this folder.
3. **Run**: Open the Terminal, drag and drop the `Start_AI_Mac_Linux.sh` file into the terminal, and hit Enter. (You may need to run `chmod +x Start_AI_Mac_Linux.sh` first to make it executable).

---

## 🐧 Linux Setup
1. **Download the Engine**: Download the Linux version of `llama-cli` from the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases). (Look for `...-bin-ubuntu-x64.zip`).
2. Extract it and place `llama-cli` in this folder.
3. **Run**: Open your terminal, navigate to this folder, and run:
   ```bash
   ./Start_AI_Mac_Linux.sh
   ```

---

## 📱 Mobile (iOS & Android) Setup
You cannot run `.bat` or `.sh` scripts directly on a standard mobile interface. However, the `brainmodel.gguf` file works perfectly!

1. Transfer the `brainmodel.gguf` file to your phone's storage.
2. Download a mobile app designed to run offline AI models. 
   - **For Android:** Download an app like **ChatterUI**, **Layla**, or **Maid**.
   - **For iOS:** Download an app like **ChatterUI** (via TestFlight) or **Private LLM**.
3. Open the app, go to Settings -> Import Model, and select your `brainmodel.gguf` file.
4. Start chatting completely offline!
