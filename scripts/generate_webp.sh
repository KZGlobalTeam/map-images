#!/bin/bash

OUTPUT="./public/webp"

if [ -d "$OUTPUT" ]; then
    rm -r "$OUTPUT"
fi
mkdir -p "$OUTPUT/thumb"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    echo "Generating webp for $name"
    gm convert -quality 80 "$file" "$OUTPUT/${name%.*}.webp"
    gm convert -quality 50 -thumbnail 200 "$file" "$OUTPUT/thumb/${name%.*}.webp"
done

shopt -u nullglob
shopt -u nocaseglob

echo "WEBP generated"