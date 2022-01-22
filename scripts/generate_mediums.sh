#!/bin/bash

OUTPUT="./public/mediums"

rm -r "$OUTPUT"
mkdir -p "$OUTPUT"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    echo "Generating medium for $name"
    gm convert -thumbnail 512 "$file" "$OUTPUT/$name"
done

shopt -u nullglob
shopt -u nocaseglob

echo "Mediums generated"
