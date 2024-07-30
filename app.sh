#!/bin/bash
# Function to fetch changes from a repository
fetch_changes() {
    echo "Fetching changes from a repository..."

    if [ ! -d "$HOME/storage/downloads/github/termux" ]; then
        echo "The specified directory does not exist."
        return 1
    fi

    cd "$HOME/storage/downloads/github/termux"

    if [ ! -d .git ]; then
        echo "The specified directory is not a Git repository."
        return 1
    fi

    git fetch --all

    if [ $? -eq 0 ]; then
        echo "Changes fetched successfully!"
        echo "Use 'git branch -a' to see all branches, including remote ones."
        echo "Use 'git merge' or 'git rebase' to integrate the changes."
    else
        echo "Failed to fetch changes. Please check your network and permissions."
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
function time_now() {
    date +"%T"
}
function sel_f_update() {
    echo "Updating..."
    curl -k -o ~/app.sh https://raw.githubusercontent.com/sunresh/termux/main/app.sh && chmod +x ~/app.sh
    echo "File downloaded and set as executable."
}

function exit_script() {
    echo "Exiting script..."
    exit 0
}
function updatae(){
  find "$HOME/storage/downloads/github/termux" -mindepth 1 -delete
  git clone "https://www.github.com/sunresh/termux" "$HOME/storage/downloads/github/termux"
}
function cdHome(){
  cd "$HOME/storage/downloads/github/termux"
}
while true; do
    echo "###################################"
    echo "#  GitHub  Operations   Menu:     #"
    echo "###################################"
    echo "# 1. Exit            2. Clone     #"
    echo "# 3. Home             4. Pull     #"
    echo "# 5. Fetch        6. Self update  #"
    echo "# 7. Time         8. List repos   #"
    echo "###################################"

    read -p "Enter your choice (1-7): " choice

    case $choice in
        1) exit_script ;;
        2) sel_f_update ;;
        3) cdHome ;;
        4) pull_changes ;;
        5) fetch_changes ;;
        6) updatae ;;
        7) time_now ;;
        8) list_files ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
