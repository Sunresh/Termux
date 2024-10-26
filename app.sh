#!/bin/bash

# Declare the global variable
# TERMUX_PATH="/storage/emulated/0/Download/github/termux"
TERMUX_PATH="$PWD"
###############
# Functions for github setup

# Function to set up GitHub CLI
setup_github_cli() {
    echo "Setting up GitHub CLI..."
    gh auth login -h github.com -p https -w
    if [ $? -ne 0 ]; then
        echo "GitHub CLI setup failed. Exiting."
        exit 1
    fi
}

# Function to configure Git
configure_git() {
    echo "Configuring Git..."
    read -p "Enter your GitHub username: " github_username
    read -p "Enter your GitHub email: " github_email

    git config --global user.name "$github_username"
    git config --global user.email "$github_email"
}

# Function to set up credential helper
setup_credential_helper() {
    echo "Setting up credential helper..."
    git config --global credential.helper store
}

# Function to prepare for future GUI integration
prepare_for_gui() {
    echo "Preparing for future GitHub GUI integration..."
    mkdir -p ~/.termux-github
    touch ~/.termux-github/gui_config.json
    echo '{"gui_enabled": false, "gui_port": 8080}' > ~/.termux-github/gui_config.json
    echo "GUI configuration file created at ~/.termux-github/gui_config.json"
}

# Main function
main_g_setup() {
    configure_git
    setup_github_cli
    setup_credential_helper
    prepare_for_gui

    echo "GitHub setup complete!"
    echo "Your credentials are stored locally and securely."
    echo "You can now use Git and GitHub CLI in Termux."
    echo "A configuration file for future GUI integration has been created."
}


###############
function load_file() {
    source "$TERMUX_PATH/$1"
}

function exit_script() {
    echo "Exiting script..."
    exit 0
}

function updatae() {
    clear
    find "$TERMUX_PATH" -mindepth 1 -delete
    git clone "https://www.github.com/sunresh/termux" "$TERMUX_PATH"
}

function git_menu() {
    clear
    echo "###################################"
    echo "#  GitHub  Operations   Menu:     #"
    echo "###################################"
    echo "# 1. Setup            2. Clone    #"
    echo "# 3. Push repos       4. Fetch    #"
    echo "# 5. Choose Branch    6. Back     #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) main_g_setup ;;
        2) load_file "g_clone.sh" ;;
        3) load_file "g_push.sh" ;;
        4) load_file "g_fetch.sh" ;;
        5) load_file "g_choose.sh" ;;
        6) load_file "app.sh" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

function main() {
    clear
    echo "###################################"
    echo "#  Sunresh  Operations   Menu:    #"
    echo "###################################"
    echo "# 1. Git              2. Update   #"
    echo "# 3. make h command               #"
    echo "# 4. Exit             5. clear    #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) git_menu ;;
        2) updatae ;;
        3) load_file "init_setup.sh" ;;
        4) exit_script ;;
        5) clear ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

main
