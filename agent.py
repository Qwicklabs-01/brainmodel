from langchain_community.llms import Ollama
from langchain.agents import initialize_agent, Tool, AgentType
from media_tools import generate_image, generate_music, generate_video

# Define tools
tools = [
    Tool(
        name="Generate_Image",
        func=generate_image,
        description="Useful for when you need to generate a high quality image, picture, or photograph. Input should be a detailed visual description."
    ),
    Tool(
        name="Generate_Video",
        func=generate_video,
        description="Useful for when you need to generate a video or short clip. Input should be a description of the video."
    ),
    Tool(
        name="Generate_Music",
        func=generate_music,
        description="Useful for when you need to generate a song, audio track, or music. Input should be a description of the music style and instruments."
    )
]

def get_agent():
    # We use llama3.2 running locally on Ollama as the 'Brain'
    llm = Ollama(model="llama3.2")
    
    # Initialize the agent to use ReAct logic
    agent = initialize_agent(
        tools, 
        llm, 
        agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION, 
        verbose=True,
        handle_parsing_errors=True
    )
    return agent
