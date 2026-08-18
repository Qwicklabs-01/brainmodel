# Running LLM Models Locally

To run LLM models locally in Termux (on Android) and Git Bash (on Windows), the easiest and most efficient way is to use `llama.cpp` for Termux and `Ollama` for Git Bash.

Here is the step-by-step guide for both environments:

## 📱 1. Running Models in Termux (Android)

Since Termux runs on mobile hardware, we will use `llama.cpp` because it is highly optimized for ARM processors and can run small quantized models (like `.gguf` files) efficiently.

### Step 1: Update and install required packages
Open Termux and run the following commands to get the necessary build tools:
```bash
pkg update && pkg upgrade -y
pkg install clang wget git cmake make -y
```

### Step 2: Clone and build llama.cpp
We need to download the source code and compile it on your device:
```bash
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
```
*(Note: Compiling might take a few minutes depending on your phone's processor).*

### Step 3: Download a lightweight model
Phones can't run massive models, so we'll download a smaller, optimized model like TinyLlama (approx. 600MB) in GGUF format:
```bash
mkdir models
wget https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf -O models/tinyllama.gguf
```

### Step 4: Run the model
Once the download is complete, you can start chatting with the model directly in Termux:
```bash
./main -m models/tinyllama.gguf -p "Hello, how are you today?" -n 400 -c 2048
```
- `-p` sets your prompt.
- `-n` is the number of tokens to generate.

If you want an interactive chat session, run: 
```bash
./main -m models/tinyllama.gguf -i -ins
```

---

## 💻 2. Running Models in Git Bash (Windows)

Git Bash is a terminal emulator for Windows. The absolute easiest way to run models in Windows/Git Bash is by using Ollama, which manages all the heavy lifting and model downloading for you.

### Step 1: Install Ollama for Windows
1. Go to [ollama.com/download](https://ollama.com/download)
2. Download the Windows installer and run it.
3. Ollama will run as a background service on your PC.

### Step 2: Open Git Bash and pull a model
Open your Git Bash terminal. You can immediately start using the `ollama` command. Let's pull Llama 3 (an 8B parameter model, requires ~4.7GB of RAM):
```bash
ollama pull llama3
```
*(If your PC is less powerful, you can pull a smaller model by running `ollama pull phi3` or `ollama pull tinyllama`).*

### Step 3: Run the model
Once downloaded, you can start an interactive chat session right inside Git Bash:
```bash
ollama run llama3
```
You will get a `>>>` prompt where you can start typing your questions. To exit the chat, type `/bye`.

### Alternative for Git Bash (using llama.cpp):
If you don't want to install Ollama and just want a standalone executable:
1. Go to the [llama.cpp releases page](https://github.com/ggerganov/llama.cpp/releases).
2. Download the `llama-xxxx-bin-win-avx2-x64.zip` file (if you have a modern Intel/AMD CPU).
3. Extract it to a folder.
4. Download a `.gguf` model from Hugging Face.
5. In Git Bash, navigate to the folder and run: 
```bash
./main.exe -m path/to/model.gguf -i -ins
```

---

## 📲 3. Downloading Ollama in Mobile (Termux)

To download and run Ollama on your mobile device (via Termux), there is an important detail to know: Ollama does not have an official native Android app or native Termux package.

However, you can still run it by installing a lightweight Linux environment (Ubuntu) inside Termux.

> **WARNING**
> Running Ollama this way uses your phone's CPU only. It cannot easily access your phone's GPU for acceleration, so it will be slower than running `llama.cpp` natively. Make sure you have enough free storage (at least 5-10GB) for the Ubuntu environment and the models.

Here are the step-by-step instructions to get Ollama working in Termux:

### Step 1: Install proot-distro in Termux
First, we need to install a tool that allows you to run Linux distributions inside Termux. Open Termux and run:
```bash
pkg update && pkg upgrade -y
pkg install proot-distro -y
```

### Step 2: Install Ubuntu
Now, install Ubuntu Linux inside your Termux:
```bash
proot-distro install ubuntu
```

### Step 3: Log in to the Ubuntu Environment
Whenever you want to use Ollama, you will first need to "log in" to this Ubuntu environment. Run:
```bash
proot-distro login ubuntu
```
*(You will notice your terminal prompt changes to `root@localhost` — you are now inside Ubuntu!)*

### Step 4: Install Dependencies inside Ubuntu
Before installing Ollama, you need to make sure `curl` is installed in your new Ubuntu system:
```bash
apt update && apt upgrade -y
apt install curl -y
```

### Step 5: Install Ollama
Now you can install Ollama using the official Linux installation script:
```bash
curl -fsSL https://ollama.com/install.sh | sh
```
*(This will download and install the Ollama background service).*

### Step 6: Start the Ollama Service
Because you are inside a mobile Linux container, background services don't start automatically. You have to start the Ollama server manually. Run this command and leave this terminal window open:
```bash
ollama serve
```

### Step 7: Download and Run a Model
To actually chat with a model, you need to open a **new, second Termux session** (swipe from the left edge of your screen in Termux and tap "New session").

In the new session, log back into Ubuntu:
```bash
proot-distro login ubuntu
```

Then, run a lightweight model (like TinyLlama or Phi-3) since mobile hardware is limited:
```bash
ollama run tinyllama
```

Ollama will download the model and drop you into a chat prompt where you can start talking to it!

**To quit later:** type `/bye` to exit the chat, and you can close the Termux sessions. Remember that every time you open Termux to use Ollama, you must run `proot-distro login ubuntu` and start `ollama serve` first.

---

## 🌐 4. Using Models for Free (Other Modes & GUIs)

If you don't want to use the command line (like Git Bash or Termux) and prefer a graphical user interface (GUI) or cloud-based free alternatives, here are the best options:

### A. Free Desktop GUIs (Run Locally)
Instead of using terminal commands, you can download software that provides a ChatGPT-like interface but runs entirely on your PC:
1. **LM Studio** (lmstudio.ai): 
   - Available for Windows, Mac, and Linux.
   - You can search for and download models directly from Hugging Face inside the app.
   - Extremely user-friendly with a sleek interface.
2. **GPT4All** (gpt4all.io): 
   - Great for older or less powerful computers.
   - Comes with an installer that lets you choose and download models with one click.
3. **Open WebUI**:
   - If you installed Ollama, you can run Open WebUI (often via Docker) to get a web-based interface (similar to ChatGPT) that connects locally to your Ollama models.

### B. Free Cloud-Based Options (No Hardware Required)
If your phone or PC isn't powerful enough, you can use powerful open-source models for free online:
1. **Hugging Face Chat** (huggingface.co/chat): 
   - A free alternative to ChatGPT where you can choose to talk to top open models like Llama 3 or Mixtral without creating an account.
2. **Groq** (groq.com):
   - Provides lightning-fast chat for open-source models like Llama 3. Completely free and incredibly fast.
3. **Google AI Studio** (aistudio.google.com):
   - Free access to Google's Gemini models. You get a generous free tier for testing in your browser.
4. **Mistral Le Chat** (chat.mistral.ai):
   - Free chat interface for Mistral's open and commercial models.

---

## ☁️ 5. Using GitHub Codespaces (Run Models in Mobile via Cloud)

Using **GitHub Codespaces** to run LLM models on your mobile phone is a brilliant idea! 

Because GitHub Codespaces gives you a full Linux Virtual Machine (VM) running in the cloud, all the heavy processing (CPU, RAM, and downloading) happens on Microsoft's servers, **not on your phone**. Your phone only acts as a screen to view the terminal.

Here is exactly how you can set up and run models in GitHub Codespaces for free using your mobile browser:

### Step 1: Create a GitHub Account & Repository
1. Open your mobile web browser (Chrome, Safari, etc.).
2. Go to [github.com](https://github.com/) and log in (or create a free account).
3. Create a new, empty repository. You can name it something like `my-llm-workspace`. 
4. Check the box to add a **README** file (this is required to launch a Codespace easily).

### Step 2: Launch the Codespace
1. On your new repository's page, look for the green **"<> Code"** button. Tap it.
2. Switch to the **"Codespaces"** tab.
3. Tap **"Create codespace on main"**.
4. A new browser tab will open, loading a full web version of Visual Studio Code. *(Tip: Turn your phone sideways into landscape mode, as VS Code is easier to use horizontally).*

### Step 3: Open the Terminal
1. Once the VS Code editor loads in your browser, tap the menu (three horizontal lines) at the top left.
2. Tap **Terminal** > **New Terminal**.
3. A terminal window will open at the bottom of the screen. You now have access to a powerful Linux server!

### Step 4: Install Ollama in the Codespace
Since Codespaces runs Linux (usually Ubuntu), installing Ollama is incredibly fast and easy. In the terminal, type (or paste) this command and press Enter:
```bash
curl -fsSL https://ollama.com/install.sh | sh
```
*(GitHub's servers have incredibly fast internet, so this will take only a few seconds).*

### Step 5: Start the Ollama Service
Before you can pull a model, the background service needs to be running. Type this into the terminal:
```bash
ollama serve
```
*(This command will stay running in the foreground. Leave it alone!)*

### Step 6: Open a Second Terminal and Run the Model
1. Tap the **"+"** icon in the terminal window to open a second terminal tab.
2. GitHub's free Codespaces usually give you a 2-core CPU with 4GB or 8GB of RAM. Therefore, you should use smaller models so the VM doesn't crash. 
3. Run this command to download and chat with **Phi-3** (Microsoft's highly intelligent, lightweight model) or **TinyLlama**:
```bash
ollama run phi3
```
*(GitHub will download the model at speeds of 100MB/s+!)*

### Step 7: Chat!
Once the download finishes, you'll see the `>>>` prompt. You can now type your messages and chat with the model directly from your mobile browser.

> [!TIP]
> **Important Notes for Codespaces:**
> - **Free Tier Limits:** Free GitHub accounts get **60 hours** of Codespaces usage per month (on a 2-core machine).
> - **Inactivity:** If you close the browser tab, the Codespace will pause automatically after about 30 minutes to save your hours. When you return, just click "Resume".
> - **Storage:** Your downloaded models will be saved in the Codespace. When you resume it, the models will still be there!

---

# How to View Markdown Files on Mobile

To get a `.md` file from your Windows PC to your mobile phone and view it properly, you need to follow two steps: transferring the file and opening it with the right app.

## Step 1: Transfer the file to your mobile
Here are the easiest ways to move files to your phone:

* **Method 1: Email or Messaging Apps (Easiest)**
  * Attach the file to an email and send it to yourself, then open the email app on your phone and download it.
  * Alternatively, send it to yourself using "Saved Messages" in Telegram, or a personal chat in WhatsApp.

* **Method 2: Cloud Storage (Best for keeping it updated)**
  * Upload the file to Google Drive, OneDrive, or Dropbox from your PC.
  * Open the corresponding app on your phone and you can access the file immediately.

* **Method 3: USB Cable**
  * Plug your phone into your PC using a USB cable. Select "File Transfer" on your phone.
  * Copy the file into your phone’s Documents or Download folder.

## Step 2: Open and read the file on your mobile
Your phone’s default text editor will usually open `.md` (Markdown) files, but it will just look like plain text with a bunch of `*` and `#` symbols.

To see it beautifully formatted (with bold text, headings, and code blocks like on a website), you should use a Markdown reader app:

### For Android:
1. **Markor** (Highly recommended, free, and open-source) - Download from the Play Store. It is perfect for reading and editing `.md` files.
2. **Obsidian** - A powerful note-taking app that reads Markdown perfectly.

### For iPhone (iOS):
1. **Taio** or **1Writer** (Search the App Store). Both are excellent for rendering Markdown.
2. **Obsidian** - Also available for iOS.

### The "No-App" Alternative: 
If you don't want to install an app, you can:
1. Upload the file to a GitHub repository.
2. Simply open that GitHub repository link in your mobile web browser (Chrome/Safari), and GitHub will automatically display the file perfectly formatted!
