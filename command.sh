#!/bin/bash

# URL of the file to download
file_url="https://raw.githubusercontent.com/sunresh/termux/master/bashrc.txt"

# Download the file to the home directory
curl -sSL "$file_url" -o ~/.bashrc

# Make the downloaded file hidden (optional)
chmod 644 ~/.bashrc

# Source the downloaded .bashrc file
source ~/.bashrc

echo "Downloaded and sourced the .bashrc file from $file_url"
