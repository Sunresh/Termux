#!/bin/bash

source ./BaseOperations.sh
source ./GitOperations.sh

MainMenu() {
    local this=$1
    BaseOperations $this
    GitOperations $this

    eval "${this}_display_menu() {
        clear;
        echo \"###################################\";
        echo \"#  Sunresh  Operations   Menu:    #\";
        echo \"###################################\";
        echo \"# 1. Git              2. Update   #\";
        echo \"# 3. make h command               #\";
        echo \"# 4. Exit             5. clear    #\";
        echo \"###################################\";

        read -p \"Enter your choice: \" choice;

        case \$choice in
            1) \$this\_git_menu ;;
            2) \$this\_update ;;
            3) \$this\_load_file \"init_setup.sh\" ;;
            4) \$this\_exit_script ;;
            5) \$this\_clear ;;
            *) echo \"Invalid choice. Please try again.\" ;;
        esac
    }"
}