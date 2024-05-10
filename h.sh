#!/bin/bash

# Function to print a section header
print_section_header() {
    echo "====================="
}

# Function to print cheat code with title, description, and example
print_cheat_code() {
    print_section_header
    echo "----- $1 -----"
    echo "Description: $2"
    echo "Example: $3"
}

# Function to display a list of useful Termux cheat codes
helper_cheat() {
    clear  # Clear the screen before displaying help
    echo "Termux Cheat Codes:"
    print_section_header
    
    # Display common Termux commands with descriptions and examples
    print_cheat_code "nano" \
        "Open GNU nano text editor." \
        "nano my_file.txt"

    print_cheat_code "ls" \
        "List all files and folders." \
        "ls"

    print_cheat_code "ls -l" \
        "List all files and folders in detailed format." \
        "ls -l"

    print_cheat_code "ls -la" \
        "List all files and folders in detailed format, including hidden ones." \
        "ls -la"

    print_cheat_code "pwd" \
        "Print the current working directory." \
        "pwd"

    print_cheat_code "rm" \
        "Remove files or directories." \
        "rm file.txt"

    print_cheat_code "cp" \
        "Copy files or directories." \
        "cp file.txt /path/to/destination/"

    print_cheat_code "mv" \
        "Move files or directories." \
        "mv file.txt /path/to/new_location/"

    print_cheat_code "mkdir" \
        "Create a new directory." \
        "mkdir new_directory"

    print_cheat_code "rmdir" \
        "Remove an empty directory." \
        "rmdir directory_to_remove"

    print_cheat_code "touch" \
        "Create a new empty file." \
        "touch new_file.txt"

    print_cheat_code "cat" \
        "Display the contents of a file." \
        "cat file.txt"

    print_cheat_code "grep" \
        "Search for patterns in files." \
        "grep 'pattern' file.txt"

    print_cheat_code "head" \
        "Display the first few lines of a file." \
        "head -n 10 file.txt"

    print_cheat_code "tail" \
        "Display the last few lines of a file." \
        "tail -n 10 file.txt"

    print_cheat_code "chmod" \
        "Change permissions of a file or directory." \
        "chmod 755 file.txt"

    print_cheat_code "chown" \
        "Change owner of a file or directory." \
        "chown user:group file.txt"

    print_cheat_code "df" \
        "Display disk usage of the entire system." \
        "df -h"

    print_cheat_code "du" \
        "Display disk usage for a specific directory." \
        "du -sh /path/to/directory/"

    print_cheat_code "tar" \
        "Compress or extract files using tar." \
        "tar -cvf archive.tar /path/to/files/"

    print_cheat_code "unzip" \
        "Extract files from a ZIP archive." \
        "unzip archive.zip"

    print_cheat_code "ping" \
        "Send ICMP echo requests to network hosts." \
        "ping google.com"

    print_cheat_code "ifconfig" \
        "Display network interface configuration." \
        "ifconfig"

    print_cheat_code "ssh" \
        "Connect to a remote server via SSH." \
        "ssh username@hostname"

    print_cheat_code "wget" \
        "Download files from the internet." \
        "wget https://example.com/file.txt"

    print_cheat_code "curl" \
        "Transfer data from or to a server." \
        "curl -O https://example.com/file.txt"

    print_cheat_code "top" \
        "Display and update information about running processes." \
        "top"

    print_cheat_code "ps" \
        "Display information about running processes." \
        "ps aux"

    print_cheat_code "kill" \
        "Terminate a process by its PID." \
        "kill 1234"
}

# Function to present the user with a menu of options
choose_option() {
    local options=("Download File" "Clear Screen" "Update System" "Show Cheat Codes" "Exit")
    PS3="Enter your choice: "

    select opt in "${options[@]}"; do
        case $opt in
            "Download File")
                wget https://raw.githubusercontent.com/sunresh/termux/main/h.sh -O ~/h.sh
                chmod +x ~/h.sh
                echo "File downloaded and set as executable."
                break
                ;;
            "Clear Screen")
                clear
                break
                ;;
            "Update System")
                apt update && apt upgrade -y
                echo "System updated."
                break
                ;;
            "Show Cheat Codes")
                helper_cheat
                break
                ;;
            "Exit")
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid option. Please choose a valid number."
                ;;
        esac
    done
}

# Clear the screen and display the menu
clear
choose_option
