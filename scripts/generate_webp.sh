#!/bin/bash

OUTPUT="./public/webp"

if [ -d "$OUTPUT" ]; then
    rm -r "$OUTPUT"
fi

mkdir -p "$OUTPUT/thumb"
mkdir -p "$OUTPUT/medium"

shopt -s nullglob
shopt -s nocaseglob

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    echo "Generating webp for $name"
    gm convert -quality 90 "$file" "$OUTPUT/${name%.*}.webp"
    gm convert -quality 90 -thumbnail 200 "$file" "$OUTPUT/thumb/${name%.*}.webp"
    gm convert -quality 90 -thumbnail 512 "$file" "$OUTPUT/medium/${name%.*}.webp"
done

shopt -u nullglob
shopt -u nocaseglob

echo "WEBP generated"
