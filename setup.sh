#!/bin/bash


echo "Welcome to the AskAI setup script!"


echo "Checking for Python installation..."
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Please install Python3 and try again."
    exit 1
fi
echo "Python3 is installed."


echo "Installing Python dependencies..."
pip install --upgrade pip
pip install google-generativeai


echo "Please enter your Google Generative AI API key:"
read -s API_KEY  # -s makes the input secret
echo "Saving your API key..."


echo "API_KEY=\"$API_KEY\"" > .env


echo "Making scripts executable..."
chmod +x askai


echo "Setup is complete. You can now use AskAI by running:"
echo "./askai \"Your prompt here\""
