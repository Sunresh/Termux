#!/bin/bash

function load_file() {
    source "$HOME/storage/downloads/github/termux/$1"
}

function push_changes() {
    echo "Pushing changes to a repository..."
    read -p "Enter local repository: " local_dir

    if [ ! -d "$HOME/storage/downloads/Github/$local_dir" ]; then
        echo "The specified directory does not exist."
        return 1
    fi

    cd "$HOME/storage/downloads/Github/$local_dir"

    if [ ! -d .git ]; then
        echo "The specified directory is not a Git repository."
        return 1
    fi

    git status

    read -p "Do you want to stage all changes? (y/n): " stage_all
    if [ "$stage_all" = "y" ]; then
        git add .
    else
        echo "Please use 'git add' to stage your changes manually."
        return 0
    fi

    read -p "Enter a commit message: " commit_message
    git commit -m "$commit_message"

    current_branch=$(git rev-parse --abbrev-ref HEAD)
    read -p "Enter the remote branch to push to (default: $current_branch): " remote_branch
    remote_branch=${remote_branch:-$current_branch}

    git push origin "$remote_branch"

    if [ $? -eq 0 ]; then
        echo "Changes pushed successfully!"
    else
        echo "Failed to push changes. Please check your network and permissions."
    fi
}

# Function to clone a repository
clone_repository() {
  echo "Cloning a repository...from sunresh"
  read -p "Enter GitHub repo: " repo_name

  # check_and_create_path "storage/downloads/Github/$repo_name"
  find "$HOME/storage/downloads/github/$repo_name" -mindepth 1 -delete

  git clone "https://www.github.com/sunresh/$repo_name" "$HOME/storage/downloads/Github/$repo_name"

  if [ $? -eq 0 ]; then
    echo "$repo_name is cloned successfully into storage/downloads/Github/$repo_name"
  else
    echo "Failed to clone repository. Please check the URL and your permissions."
  fi
}

function exit_script() {
    echo "Exiting script..."
    exit 0
}

function updatae(){
    clear
    find "$HOME/storage/downloads/github/termux" -mindepth 1 -delete
    git clone "https://www.github.com/sunresh/termux" "$HOME/storage/downloads/github/termux"
}

function g_setup() {
    clear 
    source "$HOME/storage/downloads/github/termux/g_setup.sh"
}
function esr(){
    source "$HOME/storage/downloads/github/termux/c.sh"
}
function git_menu() {
    clear
    echo "###################################"
    echo "#  GitHub  Operations   Menu:     #"
    echo "###################################"
    echo "# 1. Setup            2. Clone    #"
    echo "# 3. Push repos       4. Fetch    #"
    echo "# 5. Back                         #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) g_setup ;;
        2) clone_repository ;;
        3) push_changes ;;
        4) load_file "g_fetch_change.sh" ;;
        5) load_file "app.sh" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}
function 
function main() {
    clear
    echo "###################################"
    echo "#  Sunresh  Operations   Menu:    #"
    echo "###################################"
    echo "# 1. Git              2. Update   #"
    echo "# 3. Exit             4. clear    #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) git_menu ;;
        2) updatae ;;
        3) exit_script ;;
        4) clear ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}
main
