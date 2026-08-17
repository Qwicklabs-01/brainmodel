import os
from agent import get_agent

# Ensure test doesn't fail on missing HF token for basic text queries
if not os.getenv("HUGGINGFACE_API_TOKEN"):
    os.environ["HUGGINGFACE_API_TOKEN"] = "test_token"

try:
    print("Initializing agent...")
    agent = get_agent()
    print("Testing basic text generation...")
    response = agent.run("What is 2+2? Answer in one word.")
    print(f"Agent response: {response}")
    print("SUCCESS")
except Exception as e:
    print(f"FAILED: {e}")
