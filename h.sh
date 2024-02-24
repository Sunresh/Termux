#!/bin/bash


# Function to display section headers
print_section_header() {
    echo ""
    echo "______________________"
    echo ""
}

# Function to display cheat codes
print_cheat_code() {
    print_section_header
    echo "$1"
    echo " "
    echo "$2"
    echo " "
    echo "$3"
    echo " "
}

# Display cheat codes for reference
echo "Termux Cheat Codes:"
print_section_header

print_cheat_code "nano " " Open GNU nano text editor." "Example: nano my_file.txt"

print_cheat_code "o   " " List all files and folders in detailed format." "Example: ls -l"

print_cheat_code "ll   " " List all files and folders in detailed format (including hidden)." "Example: ls -la"

print_cheat_code "pwd    " "    : Print the current working directory." "Example: pwd"

print_cheat_code "ls      " "   : List all files and folders." "Example: ls"

print_cheat_code "l        " "  : List all files and folders in a compact format." "Example: ls -CF"

print_cheat_code "la     " "    : List all files and folders (including hidden) in a compact format." "Example: ls -A"

print_cheat_code "rm       " "  : Remove files or directories." "Example: rm file.txt"

print_cheat_code "cls     " "   : Clear the screen." "Example: clear"

print_cheat_code "cp      " "   : Copy files or directories." "Example: cp file.txt destination/"

print_cheat_code "mv      " "   : Move files or directories." "Example: mv file.txt new_location/"

print_cheat_code "mkdir    " "  : Create a directory." "Example: mkdir new_directory"

print_cheat_code "rmdir   " "   : Remove a directory." "Example: rmdir directory_to_remove"

print_cheat_code "touch    " "  : Create a new file." "Example: touch new_file.txt"

print_cheat_code "cat     " "   : Display the contents of a file." "Example: cat file.txt"

print_cheat_code "grep    " "   : Search for patterns in files." "Example: grep pattern file.txt"

print_cheat_code "head     " "  : Display the beginning of a file." "Example: head file.txt"

print_cheat_code "tail    " "   : Display the end of a file." "Example: tail file.txt"

print_cheat_code "chmod   " "   : Change permissions of a file or directory." "Example: chmod 755 file.txt"

print_cheat_code "chown    " "  : Change owner of a file or directory." "Example: chown user:group file.txt"

print_cheat_code "df      " "   : Display disk usage." "Example: df -h"

print_cheat_code "du      " "   : Display disk usage of files and directories." "Example: du -sh directory/"

print_cheat_code "tar     " "   : Compress or extract files." "Example: tar -cvf archive.tar files/"

print_cheat_code "unzip   " "   : Extract files from a zip archive." "Example: unzip archive.zip"

print_cheat_code "ping     " "  : Send ICMP Echo Request packets to network hosts." "Example: ping google.com"

print_cheat_code "ifconfig  " " : Display network interface configuration." "Example: ifconfig"

print_cheat_code "ssh      " "  : Connect to a remote server using SSH." "Example: ssh username@hostname"

print_cheat_code "wget    " "   : Download files from the internet." "Example: wget https://example.com/file.txt"

print_cheat_code "curl    " "   : Transfer data from or to a server." "Example: curl -O https://example.com/file.txt"

print_cheat_code "top     " "   : Display and update sorted information about processes." "Example: top"

print_cheat_code "ps      " "   : Display information about processes." "Example: ps aux"

print_cheat_code "kill     " "  : Terminate processes." "Example: kill PID"

apt update && apt upgrade -y

pkg install fish

wget https://raw.githubusercontent.com/sunresh/termux/main/h.sh -O ~/h.sh

fish


