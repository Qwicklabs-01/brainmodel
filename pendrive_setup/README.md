# 🚀 Portable AI Pen Drive Setup

This folder contains everything you need to run AI models entirely offline from a USB Pen Drive on any Windows computer.

## How It Works
The magic happens with the `Start_Any_Model.bat` script. It uses a standalone engine (`llamafile`) to run your AI models (`.gguf` files) without needing to install anything on the host computer.

## 📋 Instructions

### Step 1: Add Your Models
You need AI model files in `.gguf` format. 
* Simply copy any `.gguf` files you want into this folder.
* **Pro Tip:** If you use Ollama, run the `Extract_Ollama_Models.ps1` script (found in the `multiplatform_setup` folder) to easily export your hidden Ollama models to `.gguf` format!

### Step 2: Run the Batch File
1. Plug your USB Pen Drive into any Windows computer.
2. Open this folder and double-click **`Start_Any_Model.bat`**.
3. *If this is your very first time running it on a new computer without the engine, the script will automatically download the ~30MB `llamafile` engine for you (internet required just once).*

### Step 3: Choose Your Model
1. A black terminal window will open and automatically detect all the `.gguf` files in your folder.
2. It will display a numbered list of your models.
3. Type the number of the model you want to chat with and press **Enter**.

### Step 4: Chat Offline
Your default web browser (Chrome, Edge, etc.) will instantly open a beautiful chat interface. You can now chat with your AI completely offline! 

*(Note: Do not close the black terminal window while chatting, as it acts as the server).*
