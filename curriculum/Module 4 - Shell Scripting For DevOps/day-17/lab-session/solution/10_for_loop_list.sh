#!/bin/bash
# for loop over a list of items

for char in jethalal babita daya popatlal bhide; do
    echo "Gokuldham society wale: $char"
done

echo "---"

# glob pattern: loop over files
for file in ./*.sh; do
    echo "Mila script: $file"
done
