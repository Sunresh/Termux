#!/bin/bash

setup_github() {
    # Configure Git
    read -p "GitHub username: " username
    read -p "GitHub email: " email
    git config --global user.name "$username"
    git config --global user.email "$email"
    git config --global credential.helper store

    # Setup GitHub CLI
    gh auth login -h github.com -p https -w || { echo "GitHub CLI setup failed"; exit 1; }

    # Prepare for GUI
    mkdir -p ~/.termux-github
    echo '{"gui_enabled":false,"gui_port":8080}' > ~/.termux-github/gui_config.json

    echo "GitHub setup complete. Credentials stored locally."
}

setup_github