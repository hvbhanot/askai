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

# Step 2: Create a virtual environment
echo "Creating a virtual environment..."
if [ ! -d "askai_env" ]; then
    python3 -m venv askai_env
    echo "Virtual environment 'askai_env' created."
else
    echo "Virtual environment 'askai_env' already exists."
fi
echo "-------------------------------"

# Step 3: Activate the virtual environment
echo "Activating the virtual environment..."
source askai_env/bin/activate
echo "Virtual environment activated."
echo "-------------------------------"

# Step 4: Upgrade pip inside the virtual environment
echo "Upgrading pip inside the virtual environment..."
pip install --upgrade pip
echo "-------------------------------"


echo "Installing required Python dependencies..."
pip install google-generativeai python-dotenv
echo "-------------------------------"


echo "Please enter your Google Generative AI API key:"
read API_KEY 
echo "Saving your API key securely in a .env file..."
echo "API_KEY=\"$API_KEY\"" > .env
echo "-------------------------------"

# Step 7: Make scripts executable
echo "Making scripts executable..."
chmod +x askai.sh
echo "-------------------------------"

# Step 8: Confirm setup completion
echo "Setup is complete. To use AskAI:"
echo "1. Activate the virtual environment: source askai_env/bin/activate"
echo "2. Run the tool: ./askai.sh \"Your prompt here\""
echo "-------------------------------"
