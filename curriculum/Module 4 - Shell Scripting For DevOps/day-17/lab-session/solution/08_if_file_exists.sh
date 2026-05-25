#!/bin/bash
# file test -f; check argument count before testing

if [[ $# -eq 0 ]]; then
    echo "Iss prakar likho budbak: $0 <file-path>"
    exit 1
fi

if [[ -f $1 ]]; then
    echo "$1 milti hai"
else
    echo "$1 nahi milti"
fi
