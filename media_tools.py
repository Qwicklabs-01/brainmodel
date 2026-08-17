import requests
import os
import time

def get_headers():
    HF_TOKEN = os.getenv("HUGGINGFACE_API_TOKEN")
    return {"Authorization": f"Bearer {HF_TOKEN}"}

def generate_image(prompt: str) -> str:
    """Generates an ULTRA HIGH QUALITY image from a text prompt and returns the file path."""
    # Upgraded to FLUX.1-schnell for state-of-the-art image quality
    API_URL = "https://api-inference.huggingface.co/models/black-forest-labs/FLUX.1-schnell"
    if not os.getenv("HUGGINGFACE_API_TOKEN"):
        return "Error: Hugging Face API token not found."
    
    # Enhance the prompt automatically for high quality
    enhanced_prompt = f"{prompt}, ultra high resolution, 8k, photorealistic, cinematic lighting, masterpiece"
    
    response = requests.post(API_URL, headers=get_headers(), json={"inputs": enhanced_prompt})
    if response.status_code == 200:
        filepath = f"generated_image_{int(time.time())}.png"
        with open(filepath, "wb") as f:
            f.write(response.content)
        return f"Successfully generated high-quality image. File saved at: {filepath}"
    return f"Error generating image: {response.text}"

def generate_video(prompt: str) -> str:
    """Generates a short video clip from a text prompt and returns the file path."""
    # Using a common text-to-video endpoint
    API_URL = "https://api-inference.huggingface.co/models/ali-vilab/text-to-video-ms-1.7b"
    if not os.getenv("HUGGINGFACE_API_TOKEN"):
        return "Error: Hugging Face API token not found."
    
    response = requests.post(API_URL, headers=get_headers(), json={"inputs": prompt})
    if response.status_code == 200:
        filepath = f"generated_video_{int(time.time())}.mp4"
        with open(filepath, "wb") as f:
            f.write(response.content)
        return f"Successfully generated high-quality video. File saved at: {filepath}"
    return f"Error generating video (Note: Video generation often requires a paid Hugging Face tier or takes 5+ minutes to load): {response.text}"

def generate_music(prompt: str) -> str:
    """Generates a short music audio clip from a text prompt and returns the file path."""
    API_URL = "https://api-inference.huggingface.co/models/facebook/musicgen-small"
    if not os.getenv("HUGGINGFACE_API_TOKEN"):
        return "Error: Hugging Face API token not found."
    
    response = requests.post(API_URL, headers=get_headers(), json={"inputs": prompt})
    if response.status_code == 200:
        filepath = f"generated_music_{int(time.time())}.wav"
        with open(filepath, "wb") as f:
            f.write(response.content)
        return f"Successfully generated music. File saved at: {filepath}"
    return f"Error generating music: {response.text}"
