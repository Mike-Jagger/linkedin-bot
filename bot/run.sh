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

# Install Python dependencies
pip install selenium

# Run the Python script based on the OS
if [ "$OS_TYPE" = "Windows" ]; then
    python send.py
elif [ "$OS_TYPE" = "Linux" ] || [ "$OS_TYPE" = "Mac" ]; then
    python3 send.py
else
    echo "Unsupported OS: $OS_TYPE"
    exit 1
fi

# Keep the command prompt open in Windows
if [ "$OS_TYPE" = "Windows" ]; then
    cmd /k
fi