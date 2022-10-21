#!/usr/bin/env bash

# Read the file line by line
while read -r line; do
    # Check if the line is a comment
    if [[ $line == \#* ]]; then
        # If it is, skip it
        continue
    fi

    # Check if the line is empty
    if [[ -z $line ]]; then
        # If it is, skip it
        continue
    fi

    # Install the package
    sudo pacman -S --noconfirm $line
done < laptop-packages