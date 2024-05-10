#!/bin/bash

# Function to display section headers
print_section_header() {
    echo "====================="
}

# Function to display cheat codes
print_cheat_code() {
    print_section_header
    echo "-------- $1 --------"
    echo "$2"
    echo "Example: $3"
}

# Install fish shell
# pkg install fish

# Download fish configuration file
wget https://raw.githubusercontent.com/sunresh/termux/main/h.sh -O ~/h.sh


choose_option() {
  local options=("file" "clear" "update" "Help" "Exit")
  PS3="....................."
  PS3="     Enter your choice: "
  select opt in "${options[@]}"; do
    case $opt in
        "file")
            wget https://raw.githubusercontent.com/sunresh/termux/main/h.sh -O ~/h.sh
            chmod +x h.sh
            break
            ;;
        "clear")
            clear
            break
            ;;
        "update")
            apt update && apt upgrade -y
            break
            ;;
        "Help")
            clear  # Clear the screen before displaying help
            print_section_header
            # Display cheat codes for reference
            echo "Termux Cheat Codes:"
            print_section_header

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
                "List all files and folders in detailed format (including hidden)." \
                "ls -la"\

            print_cheat_code "pwd" \
                "Print the current working directory." \
                "pwd"

            print_cheat_code "rm" \
                "Remove files or directories." \
                "rm file.txt"

            print_cheat_code "cp" \
                "Copy files or directories." \
                "cp file.txt destination/"

            print_cheat_code "mv" \
                "Move files or directories." \
                "mv file.txt new_location/"

            print_cheat_code "mkdir" \
                "Create a directory." \
                "mkdir new_directory"

            print_cheat_code "rmdir" \
                "Remove a directory." \
                "rmdir directory_to_remove"

            print_cheat_code "touch" \
                "Create a new file." \
                "touch new_file.txt"

            print_cheat_code "cat" \
                "Display the contents of a file." \
                "cat file.txt"

            print_cheat_code "grep" \
                "Search for patterns in files." \
                "grep pattern file.txt"

            print_cheat_code "head" \
                "Display the beginning of a file." \
                "head file.txt"

            print_cheat_code "tail" \
                "Display the end of a file." \
                "tail file.txt"

            print_cheat_code "chmod" \
                "Change permissions of a file or directory." \
                "chmod 755 file.txt"

            print_cheat_code "chown" \
                "Change owner of a file or directory." \
                "chown user:group file.txt"

            print_cheat_code "df" \
                "Display disk usage." \
                "df -h"

            print_cheat_code "du" \
                "Display disk usage of files and directories." \
                "du -sh directory/"

            print_cheat_code "tar" \
                "Compress or extract files." \
                "tar -cvf archive.tar files/"

            print_cheat_code "unzip" \
                "Extract files from a zip archive." \
                "unzip archive.zip"

            print_cheat_code "ping" \
                "Send ICMP Echo Request packets to network hosts." \
                "ping google.com"

            print_cheat_code "ifconfig" \
                "Display network interface configuration." \
                "ifconfig"

            print_cheat_code "ssh" \
                "Connect to a remote server using SSH." \
                "ssh username@hostname"

            print_cheat_code "wget" \
                "Download files from the internet." \
                "wget https://example.com/file.txt"

            print_cheat_code "curl" \
                "Transfer data from or to a server." \
                "curl -O https://example.com/file.txt"

            print_cheat_code "top" \
                "Display and update sorted information about processes." \
                "top"

            print_cheat_code "ps" \
                "Display information about processes." \
                "ps aux"

            print_cheat_code "kill" \
                "Terminate processes." \
                "kill PID"
            break
            ;;
        "Exit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please choose 1 or 2."
            ;;
        esac
    done
}

# Display the main menu
clear

choose_option