#!/bin/bash

BASH_PATH_SOURCE="$PWD"
BASH_PATH_TARGET="$HOME"

# Create a backup of the existing .bashrc in the home directory
if [ -f "$BASH_PATH_TARGET/.bashrc" ]; then
    cp "$BASH_PATH_TARGET/.bashrc" "$BASH_PATH_TARGET/.bashrc.backup"
    echo "Backup of existing .bashrc created in home directory"
fi

# Copy the .bashrc from the source to the home directory
cp "$BASH_PATH_SOURCE/bashrc.txt" "$BASH_PATH_TARGET/.bashrc"
echo "Copy complete: .bashrc copied to home directory"

# Make sure .bashrc is readable (not executable)
chmod 644 "$BASH_PATH_TARGET/.bashrc"
echo "Permissions set for .bashrc"

# Source the new .bashrc
source "$BASH_PATH_TARGET/.bashrc"
echo "New .bashrc applied"

echo "Setup complete. You can now use custom aliases and configurations."