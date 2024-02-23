#!/bin/bash

# Function to display section headers
print_section_header() {
    echo ""
    echo "______________________"
    echo ""
}

# Function to check internet connection
check_internet_connection() {
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        echo "Internet connection is online."
    else
        echo "Internet connection is offline."
    fi
    print_section_header
}

# Check internet connection status
check_internet_connection
