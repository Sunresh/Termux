#!/bin/bash

myFish() {
    if command -v fish &> /dev/null; then
        echo "Fish shell is already installed."
    else
        echo "Fish shell is not installed. Installing..."
        # Command to install Fish (assuming a Debian-based system like Termux)
        pkg install fish
    fi
    clear
    fish
    clear 

}
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


myCurl() {
  # Prompt the user for the URL
  read -p "Enter your URL: " url
  read -p "Enter file name: " outfile
  read -p "folder in sdcard: " folder

  # Validate URL format (optional)
  #if [[ ! "$url" =~ ^https?:// ]]; then
  #  echo "Error: Invalid URL format. Please start with 'http://' or 'https://'."
  #  return 1
  #fi

  # Check and create folder if needed
  if [ ! -d "/sdcard/$folder" ]; then
    echo "Folder '$folder' not found. Creating..."
    mkdir "/sdcard/$folder" || { echo "Error creating folder"; return 1; }
  fi

  curl -o "/sdcard/$folder/$outfile" "https://www.$url"
  echo "$url"
}

download_g() {
  read -p "GitHub user: " user
  read -p "GitHub project: " proj
  read -p "GitHub branch (leave empty for 'main'): " branch
  read -p "output file: " file

  if [[ -z "$branch" ]]; then
    branch="main"
  fi

  if [[ -z "$file" ]]; then
    echo "Output file cannot be empty."
    return 1
  fi

  finalurl="https://raw.githubusercontent.com/$user/$proj/$branch/$file"

  curl -o "$file" "$finalurl"
  echo "$finalurl"
}

Mytering(){
    curl -k -o ~/py.py https://raw.githubusercontent.com/sunresh/termux/main/py.py
    chmod +x ~/py.py
    echo "py.py set as executable."
}

# Function to present the user with a menu of options

dowload_h_file(){
curl -k -o ~/h.sh https://raw.githubusercontent.com/sunresh/termux/main/h.sh
                    chmod +x ~/h.sh
                    echo "File downloaded and set as executable."
}
update_termux(){
apt update && apt upgrade -y
                    echo "System updated."
}
# Main menu function
show_menu() {
    echo "Sunresh Operations Menu:"
    echo "  ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷"
    echo "  ÷ 1. mytering    2. mycurl. ÷"
    echo "  ÷ 3. fish        4. download÷"
    echo "  ÷ 5. Clear       6. cheate. ÷"
    echo "  ÷ 7. update      8. fish.   ÷"
    echo "  ÷ 9. Exit.                  ÷"
    echo "  ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷"
    read -p "Enter your choice (1-9): " choice

    case $choice in
        1) Mytering ;;
        2) myCurl ;;
        3) myFish ;;
        4) dowload_h_file ;;
        5) clear ;;
        6) helper_cheat ;;
        7) update_termux ;;
        8) myFish ;;

        9) exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}
# Main execution
while true; do
    show_menu
done
