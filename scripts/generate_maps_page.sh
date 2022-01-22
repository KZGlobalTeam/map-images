#!/bin/bash

OUTPUT="./public/README.md"

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
    append_md "|${name%.*}|![$name](webp/thumb/${name%.*}.webp)|[image](images/$name)|[medium](mediums/$name)|[thumb](thumbnails/$name)|[webp](webp/${name%.*}.webp)|[medium](webp/medium/${name%.*}.webp)|[thumb](webp/thumb/${name%.*}.webp)|"
done

shopt -u nullglob
shopt -u nocaseglob
