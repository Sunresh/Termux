#!/bin/bash

source ./MainMenu.sh

# Create MainMenu object
MainMenu "menu"

# Main loop
while true; do
    $menu_display_menu
done