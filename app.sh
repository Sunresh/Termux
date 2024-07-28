#!/bin/bash

function check_wifi() {
    # Check if the device is connected to a Wi-Fi network
    if [[ $(ip route | grep default) ]]; then
        echo "Wi-Fi is connected."
    else
        echo "Wi-Fi is not connected."
    fi
}

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

clone_repository
