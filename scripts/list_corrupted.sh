#!/bin/bash

OUTPUT="./corrupt.txt"

rm "$OUTPUT"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    gm identify "$file" >/dev/null 2>&1
    if [ "$?" == 1 ] ; then
        echo "Corrupt image: $file"
        echo "$file" >> "$OUTPUT"
    fi
done

shopt -u nullglob
shopt -u nocaseglob