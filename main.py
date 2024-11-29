import os
from dotenv import load_dotenv
import google.generativeai as genai
import argparse


load_dotenv()


api_key = os.getenv("API_KEY")
if not api_key:
    raise ValueError("API key not found. Please run the setup script and ensure the API key is set in the .env file.")

genai.configure(api_key=api_key)


model = genai.GenerativeModel("gemini-1.5-flash")


parser = argparse.ArgumentParser(description="Generate content using Generative AI.")
parser.add_argument("prompt", type=str, help="The prompt for the AI model")


args = parser.parse_args()
prompt = args.prompt

try:
    response = model.generate_content(prompt)
    print(response.text)
except Exception as e:
    print(f"Error generating content: {e}")
