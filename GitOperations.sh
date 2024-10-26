#!/bin/bash

source ./BaseOperations.sh

GitOperations() {
    local this=$1
    BaseOperations $this

    eval "${this}_g_setup() {
        clear;
        source \"$TERMUX_PATH/g_setup.sh\";
    }"

    eval "${this}_esr() {
        source \"$TERMUX_PATH/c.sh\";
    }"

    eval "${this}_git_menu() {
        clear;
        echo \"###################################\";
        echo \"#  GitHub  Operations   Menu:     #\";
        echo \"###################################\";
        echo \"# 1. Setup            2. Clone    #\";
        echo \"# 3. Push repos       4. Fetch    #\";
        echo \"# 5. Choose Branch    6. Back     #\";
        echo \"###################################\";

        read -p \"Enter your choice: \" choice;

        case \$choice in
            1) \$this\_g_setup ;;
            2) \$this\_load_file \"g_clone.sh\" ;;
            3) \$this\_load_file \"g_push.sh\" ;;
            4) \$this\_load_file \"g_fetch.sh\" ;;
            5) \$this\_load_file \"g_choose.sh\" ;;
            6) \$this\_load_file \"app.sh\" ;;
            *) echo \"Invalid choice. Please try again.\" ;;
        esac
    }"
}