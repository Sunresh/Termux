#!/bin/bash

source ./sim1.sh
source ./sim2.sh

# Create an Animal object
Animal "genericAnimal" "Generic"

# Create a Dog object
Dog "myDog" "Buddy"

# Use Animal methods
$genericAnimal_speak
echo "Animal name: $($genericAnimal_getName)"

# Use Dog methods
$myDog_speak
echo "Dog name: $($myDog_getName)"
$myDog_fetch

# Demonstrate polymorphism
animalSpeak() {
    local animal=$1
    ${animal}_speak
}

echo "Polymorphism demonstration:"
animalSpeak "genericAnimal"
animalSpeak "myDog"