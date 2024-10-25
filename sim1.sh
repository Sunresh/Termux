#!/bin/bash

Animal() {
    local this=$1
    local name=$2

    # Properties
    eval "${this}_name='$name'"

    # Methods
    eval "${this}_speak() { echo \"${this}_name is speaking\"; }"
    eval "${this}_getName() { echo \"\$${this}_name\"; }"
}