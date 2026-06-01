#!/bin/bash
# C-style for loop to create N folders

if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <prefix> <start> <end>"
    echo "Example: $0 folder 1 5"
    exit 1
fi

prefix=$1
start=$2
end=$3

for (( num=start; num<=end; num++ )); do
    mkdir "${prefix}${num}"
    echo "bana diya: ${prefix}${num}"
done
