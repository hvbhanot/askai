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

# Step 2: Install virtual environment tools
echo "Setting up a Python virtual environment..."
sudo apt install -y python3-venv
python3 -m venv askai_env
source askai_env/bin/activate
echo "-------------------------------"

# Step 3: Ensure setuptools and wheel are available
echo "Installing setuptools and wheel..."
sudo apt install -y python3-setuptools python3-wheel
echo "-------------------------------"

# Step 4: Install dependencies manually
echo "Installing required Python packages manually..."
wget https://files.pythonhosted.org/packages/source/g/google-generativeai/google-generativeai-latest.tar.gz -O google-generativeai.tar.gz
tar -xvzf google-generativeai.tar.gz
cd google-generativeai-*
python3 setup.py install
cd ..
sudo apt install -y python3-dotenv
echo "-------------------------------"

# Step 5: Ask the user for their API key and save it to a .env file
echo "Please enter your Google Generative AI API key:"
read -s API_KEY  # -s makes the input secret
echo "Saving your API key securely in a .env file..."
echo "API_KEY=\"$API_KEY\"" > .env
echo "-------------------------------"

# Step 6: Make scripts executable
echo "Making scripts executable..."
chmod +x askai.sh
echo "-------------------------------"

# Step 7: Confirm setup completion
echo "Setup is complete. You can now use AskAI by running:"
echo "./askai.sh \"Your prompt here\""
echo "-------------------------------"
