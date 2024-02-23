#!/bin/bash

# Function to display section headers
print_section_header() {
    echo ""
    echo "______________________"
    echo ""
}

# Function to display cheat codes
print_cheat_code() {
    echo "$1"
    print_section_header
}

# Display cheat codes for reference
echo "Termux Cheat Codes:"
print_section_header

print_cheat_code "nano       : Open GNU nano text editor."
print_cheat_code "o          : List all files and folders in detailed format."
print_cheat_code "ll         : List all files and folders in detailed format (including hidden)."
print_cheat_code "pwd        : Print the current working directory."
print_cheat_code "ls         : List all files and folders."
print_cheat_code "l          : List all files and folders in a compact format."
print_cheat_code "la         : List all files and folders (including hidden) in a compact format."
print_cheat_code "rm         : Remove files or directories."
print_cheat_code "cls        : Clear the screen."
print_cheat_code "cp         : Copy files or directories."
print_cheat_code "mv         : Move files or directories."
print_cheat_code "mkdir      : Create a directory."
print_cheat_code "rmdir      : Remove a directory."
print_cheat_code "touch      : Create a new file."
print_cheat_code "cat        : Display the contents of a file."
print_cheat_code "grep       : Search for patterns in files."
print_cheat_code "head       : Display the beginning of a file."
print_cheat_code "tail       : Display the end of a file."
print_cheat_code "chmod      : Change permissions of a file or directory."
print_cheat_code "chown      : Change owner of a file or directory."
print_cheat_code "df         : Display disk usage."
print_cheat_code "du         : Display disk usage of files and directories."
print_cheat_code "tar        : Compress or extract files."
print_cheat_code "unzip      : Extract files from a zip archive."
print_cheat_code "ping       : Send ICMP Echo Request packets to network hosts."
print_cheat_code "ifconfig   : Display network interface configuration."
print_cheat_code "ssh        : Connect to a remote server using SSH."
print_cheat_code "wget       : Download files from the internet."
print_cheat_code "curl       : Transfer data from or to a server."
print_cheat_code "top        : Display and update sorted information about processes."
print_cheat_code "ps         : Display information about processes."
print_cheat_code "kill       : Terminate processes."
