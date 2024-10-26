#!/bin/bash

BaseOperations() {
    local this=$1
    # TERMUX_PATH="/storage/emulated/0/Download/github/termux"
    TERMUX_PATH="$(pwd)"
    # TERMUX_PATH="$PWD"
    eval "${this}_load_file() { source \"$TERMUX_PATH/\$1\"; }"
    
    eval "${this}_exit_script() { 
        echo \"Exiting script...\";
        exit 0;
    }"

    eval "${this}_clear() { clear; }"

    eval "${this}_update() {
        clear;
        find \"$TERMUX_PATH\" -mindepth 1 -delete;
        git clone \"https://www.github.com/sunresh/termux\" \"$TERMUX_PATH\";
    }"
}