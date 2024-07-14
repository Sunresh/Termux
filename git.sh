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

# Function to check and create a directory
check_and_create_path() {
  local path="$1"  # Accept path as argument
  if [ ! -d "$path" ]; then
    echo "Creating directory: $path"
    mkdir -p "$path"
    if [ $? -eq 0 ]; then
      echo "Directory created successfully."
    else
      echo "Failed to create directory. Please check your permissions."
      exit 1
    fi
  else
    echo "Directory already exists: $path"
  fi
}

# Function to clone a repository
clone_repository() {
  echo "Cloning a repository...from sunresh"
  read -p "Enter GitHub repo: " repo_name

  $l_repo_path = "storage/downloads/Github/$repo_name"
    
  # Construct the full local path using the function
  check_and_create_path $l_repo_path  # Call with full path

  git clone "https://www.github.com/sunresh/$repo_name" $l_repo_path

  if [ $? -eq 0 ]; then
    echo "$repo_name is cloned successfully into $l_repo_path!"
  else
    echo "Failed to clone repository. Please check the URL and your permissions."
  fi
}

# Function to push changes to a repository
push_changes() {
    echo "Pushing changes to a repository..."
    read -p "Enter the path to your local repository: " local_dir
    local l_repo_path = "storage/downloads/Github/$local_dir"
    local repo_path = "$l_repo_path"
    if [ ! -d "$repo_path" ]; then
        echo "The specified directory does not exist."
        return 1
    fi

    cd "$repo_path"

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

sel_f_update() {
  echo "Updating git.sh..."
  
  read -p "GitHub branch (leave empty for 'main'): " branch

  if [[ -z "$branch" ]]; then
    branch="main"
  fi

  finalurl="https://raw.githubusercontent.com/sunresh/termux/$branch/git.sh"

  curl -o "git.sh" "$finalurl"
  echo "Congrats...$finalurl"
}

# Main menu function
show_menu() {
    echo "GitHub Operations Menu:"
    echo "1. Set up GitHub "
    echo "2. Clone a repository"
    echo "3. Push changes to a repository"
    echo "4. Exit                         5. Self update"

    read -p "Enter your choice (1-4): " choice

    case $choice in
        1) main ;;
        2) clone_repository ;;
        3) push_changes ;;
        4) exit 0 ;;
        5) sel_f_update ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

# Main execution
while true; do
    show_menu
done
