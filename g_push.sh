# Declare the global variable
TERMUX_PATH="$HOME/storage/downloads/github"

function push_changes() {
    echo "Pushing changes to a repository..."
    read -p "Enter local repository: " local_dir

    if [ ! -d "$TERMUX_PATH/$local_dir" ]; then
        echo "The specified directory does not exist."
        return 1
    fi

    cd "$TERMUX_PATH/$local_dir"

    git config --global --add safe.directory $TERMUX_PATH/$local_dir

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
push_changes