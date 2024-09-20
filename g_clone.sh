# Declare the global variable
TERMUX_PATH="/storage/emulated/0/Download/github"

# Function to clone a repository
clone_repository() {
  echo "Cloning a repository...from sunresh"
  read -p "Enter GitHub repo: " repo_name

  # check_and_create_path "storage/downloads/Github/$repo_name"
  find "$TERMUX_PATH/$repo_name" -mindepth 1 -delete

  git clone "https://www.github.com/sunresh/$repo_name" "$TERMUX_PATH/$repo_name"
  git config --global --add safe.directory $TERMUX_PATH/$repo_name
  if [ $? -eq 0 ]; then
    echo "$repo_name is cloned successfully into $TERMUX_PATH/$repo_name"
  else
    echo "Failed to clone repository. Please check the URL and your permissions."
  fi
}
clone_repository