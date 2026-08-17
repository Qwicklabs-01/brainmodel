import streamlit as st
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

st.set_page_config(page_title="Brain Model AI", layout="wide")

st.title("🧠 Brain Model: Multi-Modal Agent")
st.markdown("I am an intelligent agent. Ask me anything, or ask me to **generate an image** or **create some music**!")

# Sidebar for Team Selection
st.sidebar.title("Brain Team Roster 👔")
selected_model = st.sidebar.selectbox(
    "Select your Expert:",
    (
        "llama3.2",
        "braindesign",
        "braincoder",
        "brainseo",
        "braintaskmanager",
        "brainsocialist",
        "brainmanaging",
        "brainautomation",
        "brainwriter",
        "brainanalyst",
        "braintutor",
        "brainterminal"
    )
)
st.sidebar.markdown("---")
st.sidebar.info("Select an expert from the team to change the AI's personality and expertise!")

# Check if token is already loaded from .env
if os.getenv("HUGGINGFACE_API_TOKEN"):
    st.sidebar.success("✅ Hugging Face API Token securely loaded.")
else:
    # API Key input
    hf_token = st.sidebar.text_input("Hugging Face Access Token (Required for generating Images/Music)", type="password")
    if hf_token:
        os.environ["HUGGINGFACE_API_TOKEN"] = hf_token

# Initialize chat history
if "messages" not in st.session_state:
    st.session_state.messages = []

# Display chat messages from history on app rerun
for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])
        if "media" in msg:
            if msg["media"].endswith(".png"):
                st.image(msg["media"])
            elif msg["media"].endswith(".wav"):
                st.audio(msg["media"])
            elif msg["media"].endswith(".mp4"):
                st.video(msg["media"])

# React to user input
if prompt := st.chat_input("What would you like me to do?"):
    # Display user message
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    # Agent response
    with st.chat_message("assistant"):
        if ("image" in prompt.lower() or "music" in prompt.lower()) and not os.getenv("HUGGINGFACE_API_TOKEN"):
            st.error("Please enter a Hugging Face API Token above to generate media.")
            st.stop()
            
        with st.spinner("Brain Model is thinking..."):
            try:
                from langchain_community.llms import Ollama
                from media_tools import generate_image, generate_music, generate_video
                
                # Lightning-fast keyword routing instead of slow ReAct logic
                prompt_lower = prompt.lower()
                media_file = None
                
                if "image" in prompt_lower or "picture" in prompt_lower or "photo" in prompt_lower:
                    response = generate_image(prompt)
                    if response.startswith("Success"):
                        media_file = response.split("File saved at: ")[1].strip()
                elif "video" in prompt_lower or "clip" in prompt_lower:
                    response = generate_video(prompt)
                    if response.startswith("Success"):
                        media_file = response.split("File saved at: ")[1].strip()
                elif "music" in prompt_lower or "song" in prompt_lower or "audio" in prompt_lower:
                    response = generate_music(prompt)
                    if response.startswith("Success"):
                        media_file = response.split("File saved at: ")[1].strip()
                # Ask the selected model for its expert opinion, even if it generated an image
                llm = Ollama(model=selected_model)
                response = llm.invoke(prompt)
                
                st.markdown(response)
                
                if media_file:
                    if media_file.endswith(".png"):
                        st.image(media_file)
                    elif media_file.endswith(".wav"):
                        st.audio(media_file)
                    elif media_file.endswith(".mp4"):
                        st.video(media_file)

                # Add to session state
                msg_data = {"role": "assistant", "content": response}
                if media_file:
                    msg_data["media"] = media_file
                st.session_state.messages.append(msg_data)
                
            except Exception as e:
                st.error(f"An error occurred: {e}. Please ensure Ollama is running and has the llama3.2 model downloaded.")
