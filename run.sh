#!/bin/bash

# Detect the operating system
OS="$(uname -s)"

case "$OS" in
    Linux*)     OS_TYPE=Linux;;
    Darwin*)    OS_TYPE=Mac;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*) OS_TYPE=Windows;;
    *)          OS_TYPE="UNKNOWN:$OS"
esac

echo "Detected OS: $OS_TYPE"

# Function to check if Python is installed
check_python_installed() {
    command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1
}

# Check if Python is installed
if check_python_installed; then
    echo "Python is installed."
else
    echo "Python is not installed. Please install Python and try again."
    exit 1
fi

# Install Python dependencies
pip install selenium

# Goto bot folder
cd bot/

# Run the Python script based on the OS
if [ "$OS_TYPE" = "Windows" ]; then
    python send.py
elif [ "$OS_TYPE" = "Linux" ] || [ "$OS_TYPE" = "Mac" ]; then
    python3 send.py || python send.py
else
    echo "Unsupported OS: $OS_TYPE"
    exit 1
fi

# Keep the command prompt open in Windows
if [ "$OS_TYPE" = "Windows" ]; then
    cmd /k
fi