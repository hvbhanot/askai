#!/bin/bash

echo "Welcome to the AskAI setup script!"
echo "______________________________________"
echo "Checking for Python3 installation..."
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt update
    sudo apt install -y python3
else
    echo "Python3 is already installed."
fi
echo "______________________________________"

echo "Checking for pip installation..."
if ! command -v pip3 &>/dev/null; then
    echo "pip3 is not installed. Installing pip..."
    sudo apt install -y python3-pip
else
    echo "pip3 is already installed."
fi
echo "______________________________________"

echo "Upgrading pip to the latest version..."
pip3 install --upgrade pip

echo "______________________________________"
echo "Installing required Python dependencies..."
pip3 install google-generativeai python-dotenv argparse

echo "______________________________________"
echo "Please enter your Google Generative AI API key:"
read -s API_KEY 
echo "Saving your API key securely in a .env file..."
echo "API_KEY=\"$API_KEY\"" > .env

echo "______________________________________"
echo "Making scripts executable..."
chmod +x askai

echo "______________________________________"
echo "Setup is complete. You can now use AskAI by running:"
echo "./askai \"Your prompt here\""
