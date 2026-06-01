#!/bin/bash
# Strict mode — production-grade bash error handling:
#   -e            : script exits the moment any command fails
#   -u            : exits if you use an undefined variable (catches typos)
#   -o pipefail   : a pipeline fails if ANY command in it fails (not just the last)
set -euo pipefail

create_directory() {
    mkdir "$1"
    echo "$1 bana diya"
}

create_directory demo_folder
echo "Aage badhte hain - sab theek hai"
