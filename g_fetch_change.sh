
# Function to fetch changes from a repository
fetch_changes() {
    echo "Fetching changes from a repository..."
    read -p "Enter the path to your local repository: " local_dir

    if [ ! -d "$HOME/storage/downloads/Github/$local_dir" ]; then
        echo "The specified directory does not exist."
        return 1
    fi

    cd "$HOME/storage/downloads/Github/$local_dir"

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

fetch_changes