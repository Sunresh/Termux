#!/bin/bash
list_files() {
    echo "Listing files in current directory:"
    ls -l
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
  read -p "file name: " file

  if [[ -z "$file" ]]; then
    echo "Output file cannot be empty."
    return 1
  fi

  finalurl="https://raw.githubusercontent.com/sunresh/termux/main/$file"

  curl -o "$file" "$finalurl"
  echo "success \n$finalurl"
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


move_folder(){
    echo "Moving folder..."
    read -p "Enter folder name: " folder
    read -p "Enter destination: " dest
    mv $folder $dest
    echo "Folder moved."
}

move_folder_sd(){
    echo "Moving folder from /sdcard to /sdcard"
    read -p "Enter folder name: " folder
    read -p "Enter destination: " dest
    mv /sdcard/$folder /sdcard/$dest
    echo "Folder moved."
}
execu(){
    chmod +x ~/$1.sh
    echo "File $1 set as executable."
}
make_executable(){
    read -p "Enter file name: " file
    execu $file
}
# Function to change directory based on input path
cdpath() {
    local target_dir="$1"
    if [ -d "$target_dir" ]; then
        cd "$target_dir" || { echo "Error changing directory to '$target_dir'"; return 1; }
        echo "Changed directory to $target_dir" && exit 0
    else
        echo "Directory '$target_dir' does not exist."
    fi
}

# Function to handle directory navigation based on user input
gotopath() {
    read -p "Enter path: " path
    
    if [ "$path" == "Github" ]; then
        cdpath "storage/downloads/Github"
    else
        echo "Directory '$path' exists but is not 'Github'."
    fi
}


# Main menu function
show_menu() {
    echo "Sunresh Operations Menu:"
    echo "  ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷"
    echo "  ÷ 1. Exit        2. mycurl. ÷"
    echo "  ÷ 3. Git file    4. S update÷"
    echo "  ÷ 5. EXE         6. cheate. ÷"
    echo "  ÷ 7. update      8. gotopath÷"
    echo "  ÷ 9. mytering    10. Move f ÷"
    echo "  ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷"
    read -p "Enter your choice (1-9): " choice

    case $choice in
        1) exit 0;;
        2) myCurl ;;
        3) download_g ;;
        4) dowload_h_file ;;
        5) make_executable ;;
        6) list_files ;;
        7) update_termux ;;
        8) gotopath ;;
        9) Mytering ;;
        10) move_folder_sd ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}
# Main execution
while true; do
    show_menu
done
