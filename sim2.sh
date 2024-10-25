#!/bin/bash

source ./sim1.sh

Dog() {
    local this=$1
    local name=$2

    # Call the base class constructor
    Animal "${this}" "${name}"

    # Override the speak method
    eval "${this}_speak() { echo \"Woof! I'm \$${this}_name\"; }"

    # Add a new method
    eval "${this}_fetch() { echo \"\$${this}_name is fetching the ball\"; }"
}