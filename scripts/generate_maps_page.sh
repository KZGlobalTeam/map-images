#!/bin/bash

OUTPUT="./public/MAPS.md"
PUBLIC_PATH="https://bitbucket.org/kztimerglobalteam/map-images/raw/master"

append_md () {
    echo "$1" >> $OUTPUT
}

if [ -e $OUTPUT ]; then
    rm $OUTPUT
fi

append_md "# MAP IMAGES"
append_md
append_md "| Map | Thumbnail | Image Link | Thumbnail Link | WEBP Link | WEBP Thumbnail |"
append_md "|-----|-----------|------------|----------------|-----------|----------------|"

# https://stackoverflow.com/a/41139446
shopt -s nullglob
shopt -s nocaseglob

for file in ./public/thumbnails/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    append_md "|${name%.*}|![$name]($PUBLIC_PATH/webp/thumb/${name%.*}.webp)|[image]($PUBLIC_PATH/images/$name)|[thumbnail]($PUBLIC_PATH/thumbnails/$name)|[webp]($PUBLIC_PATH/webp/${name%.*}.webp)|[thumbnail]($PUBLIC_PATH/webp/thumb/${name%.*}.webp)|"
done

shopt -u nullglob
shopt -u nocaseglob