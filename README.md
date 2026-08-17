# Brain Model: Multi-Modal AI Agent & Specialized AI Team
> **Made by Sakshi ✨**

Welcome to the Brain Model project! This project consists of two powerful parts:
1. **The Brain Model Web App:** A Streamlit-based UI that allows you to chat with AI and generate high-quality Images, Videos, and Music via Hugging Face.
2. **The Brain Team:** A massive 11-member team of highly specialized, elite AI personas running locally via Ollama.

---

## 🛠️ Step 1: Install Ollama & Base Models

Since this project runs the AI models locally on your computer for maximum privacy and speed, you need to install Ollama.

1. **Download Ollama:** Go to [ollama.com](https://ollama.com/) and download the Windows installer.
2. **Install:** Run the setup file and follow the instructions.
3. **Pull the Fast Base Model:** Open PowerShell and run this command to download the `llama3.2` base model:
   ```powershell
   ollama pull llama3.2
   ```

## 👔 Step 2: Build the Specialized AI Team

The Brain Team consists of 11 professional experts (Coder, SEO, Manager, Designer, etc.) all sharing the base `llama3.2` model to save hard drive space.

To compile these specialized personas into your Ollama system, run:
```powershell
cd "c:\Users\SAKSHI\Downloads\New folder (2)\brain_team"
powershell -ExecutionPolicy Bypass -File .\build_team.ps1
```
*(Once built, you can chat with any of them in your terminal by typing `ollama run braincoder`, etc.)*

## 🌐 Step 3: Install Web App Requirements

To use the graphical interface and generate visual media, you need Python and Streamlit installed.

1. Ensure you have **Python 3.12** installed on your computer.
2. Open PowerShell and install the required libraries:
   ```powershell
   cd "c:\Users\SAKSHI\Downloads\New folder (2)"
   pip install -r requirements.txt
   ```

## 🚀 Step 4: Run the Web App

To launch the multi-modal Streamlit web app, open your PowerShell terminal and run:

```powershell
& "$env:LOCALAPPDATA\Programs\Python\Python312\Scripts\streamlit.exe" run "c:\Users\SAKSHI\Downloads\New folder (2)\brain_app.py"
```
*(The app will automatically open in your web browser. From the sidebar, you can select any of your 11 specialized AI personas to chat with!)*

---

## 📱 Step 5: How to Use on Your Mobile Phone (Free)

There are multiple ways to access your Brain Team on a mobile phone for free!

### Method 1: The Web App (Best way — supports Images & Video)
This method connects your phone directly to your computer's Streamlit server over Wi-Fi.
1. On your computer, look at the terminal window where Streamlit is currently running. You will see a **Network URL** (e.g., `http://192.168.1.6:8501`).
2. Open Safari or Google Chrome on your mobile phone.
3. Type that exact Network URL into your phone's browser.
4. You will instantly see your Brain Team Web App on your phone!

### Method 2: Download a Free Mobile App (Text-Only chat)
If you want an app that feels exactly like the ChatGPT mobile app:
1. Make sure Ollama is running in the background on your PC.
2. Go to your phone's App Store or Google Play Store and download a free app like **"Enchanted"** (iOS) or **"Chatbox"** (iOS/Android).
3. Open the app's settings and it will ask for your "Ollama Host URL". Enter your computer's local IP address with the port 11434 (for example: `http://192.168.1.6:11434`).
4. The app will automatically sync with your computer and you will see all 11 of your custom models (`braindesign`, `brainseo`, etc.) ready to chat!

---

## 📵 Step 6: Running the Models Natively ON Your Phone

If you want to run the models completely locally on your phone's hardware (without needing your PC at all), you can!
*(Note: You will need a modern phone with 4GB+ RAM, and it will drain battery quickly).*

### Option A: Using Mobile GUI Apps
**1. Download a Local AI App:**
- For iPhone/iOS: Download **PocketPal AI** (Free) from the App Store.
- For Android: Download **ChatterUI** (Free).

**2. Download the Model to your Phone:**
- Search for `Llama 3.2 (3B)` in the app's model directory.
- Download the `.gguf` file (ensure you are on Wi-Fi).

**3. Recreate the "Brain Team" Personas:**
- Open the settings of your mobile AI app and create a "New Chat" or "New Persona".
- Open the `Modelfile` for the team member you want on your PC, copy the text that says *"You are Brain SEO..."*, and paste it into your phone's **System Prompt** box.
- Save the persona. You now have a private, offline AI team!

### Option B: Using Termux (For Advanced Android Users)
Running this in Termux on an Android phone gives you a full Linux environment, allowing you to install the real Ollama directly onto your phone and use the exact same Modelfiles.

**1. Install the Correct Termux:**
- ⚠️ **CRITICAL WARNING:** Do not download Termux from the Google Play Store (it is outdated and broken).
- Option 1 (Recommended): 👉 [Download Termux from F-Droid](https://f-droid.org/en/packages/com.termux/)
- Option 2: 👉 [Download Termux from GitHub Releases v0.118.3](https://github.com/termux/termux-app/releases/tag/v0.118.3) 
  *(Scroll down to Assets and download `termux-app_v0.118.3+github-debug_arm64-v8a.apk` for modern phones, or `universal.apk` if unsure).*

**2. Set up a Linux Environment in Termux:**
Open the Termux app and run these exact commands:
```bash
pkg update && pkg upgrade -y
pkg install proot-distro -y
proot-distro install ubuntu
proot-distro login ubuntu
```

**3. Install Ollama on your Phone:**
Now that you are inside your phone's Ubuntu terminal:
```bash
apt update && apt install curl -y
curl -fsSL https://ollama.com/install.sh | sh
```

**4. Start the Server and Pull the Model:**
```bash
# Start the server in the background
ollama serve &

# Press ENTER to get your command prompt back, then download the model:
ollama pull llama3.2
```

**5. Build Your Brain Team:**
Create a file in Termux (using `nano Modelfile.seo`), paste the exact same system prompt from your PC, and run:
```bash
ollama create brainseo -f Modelfile.seo
```
Once built, you can chat with your AI expert offline by typing: `ollama run brainseo`
