# Global variables
export APP_DIR="/storage/emulated/0/download/github/termux"
export CONFIG_FILE="$APP_DIR/config.sh"

# Function to source the app script
h() {
    source "$APP_DIR/app.sh"
}

# Function to edit the app script
edit_app() {
    nano "$APP_DIR/app.sh"
}

# Function to update the app from GitHub
update_app() {
    cd "$APP_DIR"
    git config --global --add safe.directory $APP_DIR
    git pull
    cd - > /dev/null
}

# Function to show app status
app_status() {
    if [ -f "$APP_DIR/app.sh" ]; then
        echo "App script exists"
        echo "Last modified: $(stat -c %y "$APP_DIR/app.sh")"
    else
        echo "App script not found"
    fi
}

# Function to load custom configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        echo "Configuration loaded"
    else
        echo "Configuration file not found"
    fi
}

# Alias for quick navigation to app directory
alias cdapp="cd $APP_DIR"
cdapp(){
CD $APP_DIR
}