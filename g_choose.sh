# Declare the global variable
TERMUX_PATH="/storage/emulated/0/Download/github"

# Function to choose the current branch
current_branch() {
  echo "Choose a repository...from sunresh"
  read -p "Enter GitHub repo: " repo_name
  repo_path="$TERMUX_PATH/$repo_name"
  if [ -d "$repo_path" ]; then
    cd "$repo_path" || exit
    branch=$(git rev-parse --abbrev-ref HEAD)
    echo "You are currently on branch: $branch"
    echo "Available branches:"
    git branch -a

    read -p "Enter the branch you want to switch to: " branch_name

    git checkout "$branch_name"
    if [ $? -eq 0 ]; then
      echo "Switched to branch: $branch_name"
    else
      echo "Failed to switch branches. Please check if the branch name is correct."
    fi

  else
    echo "Repository path does not exist. Please clone the repository first."
  fi
}
current_branch