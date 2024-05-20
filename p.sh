if ! command -v dos2unix &> /dev/null; then
    sudo apt install dos2unix
fi

dos2unix p.sh  # Assuming you want to convert p.sh

menu_list=("Python" "install" "run" "Exit")

mainMenu() {
    while true; do
        select opt in "${menu_list[@]}"; do
            case $opt in
                "Python")
                    read -p "install:" pkg
                    python3 -m pip show $pkg
                    if ! command -v python3-$pkg &> /dev/null; then
                        apt install python3-$pkg && echo "Package $pkg installed successfully" || echo "Error installing $pkg. Please check your internet connection or try again later."
                    else
                        echo "Already"
                    fi
                    break
                    ;;
                "install")
                    # Handle install selection
                    echo "You selected: install"
                    # Add your installation logic here
                    ;;
                "run")
                    # Handle run selection
                    echo "You selected: run"
                    echo "Nepal and $opt"
                    ;;
                "Exit")
                    return
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
            break  # Exit the loop after a valid selection
        done
    done
}

mainMenu
