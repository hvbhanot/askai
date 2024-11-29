#!/bin/bash

echo "Welcome to the AskAI setup script!"

echo "Checking for Python3 installation..."
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt update
    sudo apt install -y python3 python3-pip
else
    echo "Python3 is already installed."
fi


echo "Installing Python dependencies..."
pip3 install --upgrade pip
pip3 install google-generativeai python-dotenv


echo "Please enter your Google Generative AI API key:"
read API_KEY  
echo "Saving your API key securely in a .env file..."
echo "API_KEY=\"$API_KEY\"" > .env


echo "Making scripts executable..."
chmod +x askai

echo "Setup is complete. You can now use AskAI by running:"
echo "./askai \"Your prompt here\""
