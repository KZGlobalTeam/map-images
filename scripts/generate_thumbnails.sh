#!/bin/bash

OUTPUT="./public/thumbnails"

rm -r "$OUTPUT"
mkdir -p "$OUTPUT"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    # STR+="{\"name\": \"$name\", \"src\": \"$file\"},"
    echo "Generating thumbnail for $name"
    gm convert -thumbnail 200 "$file" "$OUTPUT/$name"
done

shopt -u nullglob
shopt -u nocaseglob

echo "Thumbnails generated"