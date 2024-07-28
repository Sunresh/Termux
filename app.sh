#!/bin/bash

function list_files() {
    echo "Listing files in the current directory:"
    ls -l
}

function go_to_home() {
    cd ~
    echo "Moved to home directory."
}
go_to_folder() {
    read -p "Enter the folder name: " folder
    if [ -d "$HOME/$folder" ]; then
        cd "$HOME/$folder"
        echo "Moved to $folder."
    else
        echo "Folder not found."
    fi
}

# Function to clone a repository
clone_repository() {
  echo "Cloning a repository...from sunresh"
  read -p "Enter GitHub repo: " repo_name
  # Construct the full local path using the function
  # check_and_create_path "storage/downloads/Github/$repo_name"

  git clone "https://www.github.com/sunresh/$repo_name" "$HOME/storage/downloads/Github/$repo_name"

  if [ $? -eq 0 ]; then
    echo "$repo_name is cloned successfully into storage/downloads/Github/$repo_name"
  else
    echo "Failed to clone repository. Please check the URL and your permissions."
  fi
}

# Main menu function (updated)
show_menu() {
  exit_flag=false  # Initialize exit flag
  echo "GitHub Operations Menu:"
  echo " + 1. Set up  2. Clone       +"
  echo " + 3. Push    4. Pull        +"
  echo " + 5. Fetch   6. Self update +"
  echo " + 7. Exit                   +"

  read -p "Enter your choice (1-7): " choice

  case $choice in
      1) main ;;
      2) clone_repository ;;
      3) push_changes ;;
      4) pull_changes ;;
      5) fetch_changes ;;
      6) sel_f_update ;;
      7) exit_flag=true ;;
      *) echo "Invalid choice. Please try again." ;;
  esac
    # Call show_menu again only if the exit flag is not set
  if [[ ! $exit_flag ]]; then
    show_menu
  fi
}

show_menu






