#!/bin/bash
# real workflow: input -> check user exists with `id` -> create with useradd

create_user() {
    read -p "Naya username daalo: " username

    if id "$username" &>/dev/null; then
        echo "User '$username' pehle se hai"
        exit 1
    fi

    sudo useradd -m "$username" && echo "User '$username' ban gaya" || echo "User nahi bana"
}

create_user
