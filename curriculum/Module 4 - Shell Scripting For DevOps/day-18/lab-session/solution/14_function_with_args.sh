#!/bin/bash
# function with arguments; $1 inside function refers to function's first arg

greet() {
    echo "Namaste $1 ji!"
}

install_package() {
    echo "Installing: $1"
    # sudo apt-get install -y "$1"
}

greet "jethalal"
greet "babita"
install_package "nginx"
