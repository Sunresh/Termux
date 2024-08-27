#!/bin/bash

function load_file() {
    source "$HOME/storage/downloads/github/termux/$1"
}

function exit_script() {
    echo "Exiting script..."
    exit 0
}

function updatae(){
    clear
    find "$HOME/storage/downloads/github/termux" -mindepth 1 -delete
    git clone "https://www.github.com/sunresh/termux" "$HOME/storage/downloads/github/termux"
}

function g_setup() {
    clear 
    source "$HOME/storage/downloads/github/termux/g_setup.sh"
}
function esr(){
    source "$HOME/storage/downloads/github/termux/c.sh"
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
    echo "# 3. Exit             4. clear    #"
    echo "###################################"

    read -p "Enter your choice: " choice

    case $choice in
        1) git_menu ;;
        2) updatae ;;
        3) exit_script ;;
        4) clear ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}
main
