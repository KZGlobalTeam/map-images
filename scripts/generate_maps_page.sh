#!/bin/bash

OUTPUT="./public/README.md"
PUBLIC_PATH="https://github.com/KZGlobalTeam/map-images/raw/public"

append_md () {
    echo "$1" >> $OUTPUT
}

if [ -e $OUTPUT ]; then
    rm $OUTPUT
fi

append_md "# MAP IMAGES"
append_md
append_md "| Map | Thumbnail | Full | Medium | Thumb | WEBP Full | WEBP Medium | WEBP Thumb |"
append_md "|-----|-----------|------|--------|-------|-----------|-------------|------------|"

# https://stackoverflow.com/a/41139446
shopt -s nullglob
shopt -s nocaseglob

for file in ./public/thumbnails/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    append_md "|${name%.*}|![$name]($PUBLIC_PATH/webp/thumb/${name%.*}.webp)|[image]($PUBLIC_PATH/images/$name)|[medium]($PUBLIC_PATH/mediums/$name)|[thumb]($PUBLIC_PATH/thumbnails/$name)|[webp]($PUBLIC_PATH/webp/${name%.*}.webp)|[medium]($PUBLIC_PATH/webp/medium/${name%.*}.webp)|[thumb]($PUBLIC_PATH/webp/thumb/${name%.*}.webp)|"
done

shopt -u nullglob
shopt -u nocaseglob
