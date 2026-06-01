#!/bin/bash
# while loop with a counter; arithmetic with $((...))

num=0

while [[ $num -le 10 ]]; do
    echo "even number: $num"
    num=$((num + 2))
done
