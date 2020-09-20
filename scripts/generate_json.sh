#!/bin/bash

OUTPUT="./public/maps.json"
OUTPUT_MIN="./public/maps.min.json"
PUBLIC_PATH="https://bitbucket.org/kztimerglobalteam/map-images/raw/master"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v jq)" ]; then
    echo "Error: jq is not installed" >&2
    exit 1
fi

shopt -s nullglob
shopt -s nocaseglob

STR="["

for file in ./images/*.{jpg,jpeg,png,gif}
do
    name=$(basename -- "$file")
    STR+="{"
    STR+="\"name\": \"${name%.*}\","
    STR+="\"thumb\": \"$PUBLIC_PATH/thumbnails/$name\","
    STR+="\"src\": \"$PUBLIC_PATH/images/$name\","
    STR+="\"webp\": \"$PUBLIC_PATH/webp/${name%.*}.webp\","
    STR+="\"webp_thumb\": \"$PUBLIC_PATH/webp/thumb/${name%.*}.webp\""
    STR+="},"
done
STR=${STR::-1}
STR+="]"

shopt -u nullglob
shopt -u nocaseglob

echo $STR | jq . > "$OUTPUT"
echo $STR | jq -c . > "$OUTPUT_MIN" 
echo "Generated $OUTPUT and $OUTPUT_MIN"