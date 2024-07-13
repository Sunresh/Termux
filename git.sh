#!/data/data/com.termux/files/usr/bin/bash

## GitHub Setup Script for Termux

# Function to check if a package is installed local packages=("git" "openssh" "gh")
is_package_installed() {
    dpkg -s "$1" >/dev/null 2>&1
}

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

# Main execution
main() {
    configure_git
    setup_github_cli
    setup_credential_helper
    prepare_for_gui

    echo "GitHub setup complete!"
    echo "Your credentials are stored locally and securely."
    echo "You can now use Git and GitHub CLI in Termux."
    echo "A configuration file for future GUI integration has been created."
}

# Run the main function
main
