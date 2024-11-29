#!/bin/bash

echo "Welcome to the AskAI setup script!"
echo "-------------------------------"

# Step 1: Ensure Python3 is installed
echo "Checking for Python3 installation..."
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt update
    sudo apt install -y python3 python3-venv
else
    echo "Python3 is already installed."
fi
echo "-------------------------------"


echo "Checking for pipx installation..."
if ! command -v pipx &>/dev/null; then
    echo "pipx is not installed. Installing pipx..."
    sudo apt update
    sudo apt install -y pipx

    export PATH="$PATH:~/.local/bin"
else
    echo "pipx is already installed."
fi
echo "-------------------------------"

# Step 3: Install required Python packages using pipx
echo "Installing required Python dependencies using pipx..."
pipx install google-generativeai
pipx install python-dotenv
echo "-------------------------------"

# Step 4: Ask the user for their API key and save it to a .env file
echo "Please enter your Google Generative AI API key:"
read -s API_KEY  # -s makes the input secret
echo "Saving your API key securely in a .env file..."
echo "API_KEY=\"$API_KEY\"" > .env
echo "-------------------------------"

# Step 5: Make scripts executable
echo "Making scripts executable..."
chmod +x askai.sh
echo "-------------------------------"

# Step 6: Confirm setup completion
echo "Setup is complete. You can now use AskAI by running:"
echo "./askai.sh \"Your prompt here\""
echo "-------------------------------"
