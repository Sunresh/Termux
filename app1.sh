#!/bin/bash

# Declare the global variable
TERMUX_PATH="/storage/emulated/0/Download/github/termux"

mkdir "$TERMUX_PATH"
function load_file() {
    source "$TERMUX_PATH/$1"
}

function exit_script() {
    echo "Exiting script..."
    exit 0
}

function updatae() {
    clear
    find "$TERMUX_PATH" -mindepth 1 -delete
    git clone "https://www.github.com/sunresh/termux" "$TERMUX_PATH"
}

function g_setup() {
    clear 
    source "$TERMUX_PATH/g_setup.sh"
}

function esr() {
    source "$TERMUX_PATH/c.sh"
}

function git_menu() {
    clear
    echo "###################################"
    echo "#  GitHub  Operations   Menu:     #"
    echo "###################################"
    echo "# 1. Setup            2. Clone    #"
    echo "# 3. Push repos       4. Fetch    #"
    echo "# 5. Choose Branch    6. Back     #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) g_setup ;;
        2) load_file "g_clone.sh" ;;
        3) load_file "g_push.sh" ;;
        4) load_file "g_fetch.sh" ;;
        5) load_file "g_choose.sh" ;;
        6) load_file "app.sh" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

function main() {
    clear
    echo "###################################"
    echo "#  Sunresh  Operations   Menu:    #"
    echo "###################################"
    echo "# 1. Git              2. Update   #"
    echo "# 3. make h command               #"
    echo "# 4. Exit             5. clear    #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) git_menu ;;
        2) updatae ;;
        3) load_file "init_setup.sh" ;;
        4) exit_script ;;
        5) clear ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

main
