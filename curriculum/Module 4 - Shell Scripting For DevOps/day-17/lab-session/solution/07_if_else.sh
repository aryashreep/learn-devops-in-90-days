#!/bin/bash
# if-else with string comparison

read -p "Jethalal ki favourite kaun hai? " bandi

if [[ $bandi == "babita" ]]; then
    echo "Sahi jawab! Babita ji hi hain."
else
    echo "Galat jawab budbak."
fi
