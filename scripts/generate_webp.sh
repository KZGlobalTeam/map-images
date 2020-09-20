#!/bin/bash

OUTPUT="./webp"

rm -r "$OUTPUT"
mkdir -p "$OUTPUT/thumb"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    # STR+="{\"name\": \"$name\", \"src\": \"$file\"},"
    echo "Generating webp for $name"
    gm convert -quality 50 "$file" "$OUTPUT/${name%.*}.webp"
    gm convert -quality 50 -thumbnail 200 "$file" "$OUTPUT/thumb/${name%.*}.webp"
done

shopt -u nullglob
shopt -u nocaseglob

echo "WEBP generated"