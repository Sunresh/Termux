
check_net_connection() {
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        echo "Internet is online."
    else
        echo "Internet is offline."
    fi
}

check_net_connection
